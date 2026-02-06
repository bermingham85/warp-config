# REQUIRE_INTEGRATION_TESTS

## Trigger
Changes that affect multiple systems or external integrations.

## Action
Before completing work that touches:
- Multiple services/APIs
- Database + application code
- n8n workflows + scripts
- MCP servers + client code

**Require** integration test or manual verification.

## Test Types by Change
| Change Type | Test Required |
|-------------|---------------|
| API endpoint | curl test with expected response |
| Database schema | Query verification |
| n8n workflow | Webhook trigger test |
| MCP tool | Tool call with sample input |
| Multi-service | End-to-end flow test |

## Minimum Verification
```
1. Component A works in isolation
2. Component B works in isolation  
3. A → B communication works
4. Error case handled gracefully
```

## Skip Conditions
- Single-file, single-system change
- Documentation-only changes
- Local development iteration (test before commit)

## Category
testing, quality_assurance
