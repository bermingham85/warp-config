import hashlib
import psycopg2
import os

def check_before_ai(prompt: str, task_type: str = 'medium'):
    """Check if we can avoid AI tokens"""
    
    # 1. Check cache
    try:
        cache_key = hashlib.md5(prompt.encode()).hexdigest()
        conn = psycopg2.connect(
            host='localhost',
            port=5432,
            database='ai_cache',
            user='postgres',
            password=os.getenv('POSTGRES_PASSWORD', '')
        )
        cursor = conn.cursor()
        cursor.execute(
            "SELECT response FROM ai_response_cache WHERE query_hash = %s",
            (cache_key,)
        )
        cached = cursor.fetchone()
        conn.close()
        
        if cached:
            print(f"💚 CACHE HIT - Saved tokens!")
            return {'cached': True, 'response': cached[0]}
    except Exception as e:
        print(f"⚠️ Cache check failed: {e}")
    
    # 2. Check if tool exists
    tool_routes = {
        'file_read': 'filesystem_mcp',
        'file_write': 'filesystem_mcp',
        'file_list': 'shell_command',
        'db_query': 'postgres_direct',
        'calculation': 'python_eval',
        'web_search': 'serpapi',
        'document_extract': 'emergent_idp',
        'video_process': 'ffmpeg',
        'image_convert': 'pillow',
        'json_parse': 'jq_or_python'
    }
    
    if task_type in tool_routes:
        tool = tool_routes[task_type]
        print(f"⚠️ BLOCKED AI - Use {tool} instead")
        return {'blocked': True, 'tool': tool}
    
    # 3. Select cheapest model
    model_costs = {
        'simple': ('gemini-pro', 0.0005, 'Simple classification/chat'),
        'medium': ('gpt-4o', 0.0025, 'Code generation, analysis'),
        'complex': ('claude-sonnet', 0.003, 'Complex reasoning'),
        'expert': ('claude-opus', 0.015, 'Expert-level tasks only')
    }
    
    if task_type in model_costs:
        model, cost, desc = model_costs[task_type]
        print(f"💵 Using cheapest for '{task_type}': {model} (~${cost}/call)")
        print(f"   Purpose: {desc}")
        return {'model': model, 'cost': cost}
    
    print(f"💰💰💰 WARNING: Expensive AI call - no task_type match")
    return {'model': 'claude-sonnet', 'cost': 0.003}

def cache_response(prompt: str, response: str, model: str):
    """Cache AI response for reuse"""
    try:
        cache_key = hashlib.md5(prompt.encode()).hexdigest()
        conn = psycopg2.connect(
            host='localhost',
            port=5432,
            database='ai_cache',
            user='postgres',
            password=os.getenv('POSTGRES_PASSWORD', '')
        )
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO ai_response_cache (query_hash, prompt, response, model)
            VALUES (%s, %s, %s, %s)
            ON CONFLICT (query_hash) DO UPDATE
            SET hit_count = ai_response_cache.hit_count + 1,
                last_accessed = NOW()
        """, (cache_key, prompt, response, model))
        conn.commit()
        conn.close()
        print(f"✅ Response cached")
    except Exception as e:
        print(f"⚠️ Cache save failed: {e}")

def log_token_usage(platform: str, model: str, task_type: str, 
                     prompt_tokens: int, completion_tokens: int, cost_usd: float,
                     could_have_used_tool: bool = False, tool_alternative: str = None):
    """Log token usage for monitoring"""
    try:
        conn = psycopg2.connect(
            host='localhost',
            port=5432,
            database='ai_cache',
            user='postgres',
            password=os.getenv('POSTGRES_PASSWORD', '')
        )
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO token_usage_log 
            (platform, model, task_type, prompt_tokens, completion_tokens, total_tokens, cost_usd, could_have_used_tool, tool_alternative)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (platform, model, task_type, prompt_tokens, completion_tokens,
              prompt_tokens + completion_tokens, cost_usd, could_have_used_tool, tool_alternative))
        conn.commit()
        conn.close()
    except Exception as e:
        print(f"⚠️ Usage log failed: {e}")

if __name__ == "__main__":
    # Test
    print("Testing token_saver.py...")
    
    # Test 1: Block AI for calculation
    print("\n1. Testing calculation block:")
    result = check_before_ai("What is 2+2?", "calculation")
    print(f"Result: {result}")
    
    # Test 2: Select cheapest model for simple task
    print("\n2. Testing simple task routing:")
    result = check_before_ai("Hello, how are you?", "simple")
    print(f"Result: {result}")
    
    # Test 3: Log usage (will fail if no password, but that's ok)
    print("\n3. Testing usage logging:")
    log_token_usage('warp', 'claude-sonnet', 'test', 100, 200, 0.003)
    
    print("\n✅ Token saver module ready!")
