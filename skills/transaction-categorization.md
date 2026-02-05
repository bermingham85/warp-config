# Transaction Categorization Auto-Skill

## Trigger
Activate AUTOMATICALLY when ANY of these occur:
- User mentions transactions, receipts, bank statements, or expenses
- CSV/Excel file with financial data is referenced
- Keywords: QuickBooks, Booke.AI, categorize, reconcile, VAT, expense
- User asks about business expenses or tax implications

## Data Locations
- Rules Database: `C:\Users\bermi\Projects\quickbooks-mark2\rules\VENDOR_RULES.json`
- Transaction History: `C:\Users\bermi\Projects\quickbooks-mark2\data\`
- n8n Workflow: `http://localhost:5678` (categorization webhook)

## Irish VAT Rates (Apply Automatically)
| Rate | Value | Apply To |
|------|-------|----------|
| Standard | 23% | Most services/goods |
| Reduced | 13.5% | Tourism, accommodation (Airbnb) |
| Second Reduced | 9% | Utilities, newspapers |
| Zero | 0% | Exports, certain foods |
| Exempt - EU | N/A | Rent/lease |
| OOS | N/A | Out of scope (transfers, cashback) |

## Category Mapping (QuickBooks/Booke.AI)
| Expense Type | Category | VAT |
|-------------|----------|-----|
| Subscriptions | Dues and subscriptions | Standard |
| Utilities | Utilities | Second Reduced |
| Marketing/Ads | Other Types of Expenses-Advertising Expenses | Standard |
| Professional services | Legal and professional fees | Standard |
| Rent | Rent or lease payments | Exempt |
| Meals | Meals and entertainment | Standard |
| Travel | Travel expenses - selling expenses | Standard |
| Equipment/Repairs | Repairs and Maintenance | Standard |
| E-commerce fees | E commerce expense | Standard |
| Airbnb Income | Airbnb Income | Reduced |

## Known Vendors (Pre-Categorized)
Auto-apply rules for known vendors:
```json
{
  "Airbnb Payments": {"category": "Airbnb Income", "vat": "Reduced", "type": "income"},
  "Google Payment Ireland": {"category": "Dues and subscriptions", "vat": "Standard", "type": "expense"},
  "Electric Ireland": {"category": "Utilities", "vat": "Second Reduced", "type": "expense"},
  "PayPal": {"check_description": true, "default": "E commerce expense"},
  "Revolut Transfer": {"category": "Internal Transfer", "vat": "OOS", "type": "transfer"}
}
```

## Account Rules
- **AIB ending 1195**: Personal account - EXCLUDE from business
- **PayPal → Revolut Pro**: Internal transfer (non-taxable)
- **PayPal → AIB 1195**: Personal use of business funds
- **All Airbnb income**: VAT-inclusive at 13.5%
- **PayPal before June 2022**: Personal/pre-Airbnb

## Behavior

### On Transaction Data Received
1. **Parse file** (CSV, Excel, JSON)
2. **For each transaction**:
   - Match vendor against VENDOR_RULES.json
   - If match: Apply category + VAT
   - If no match: Analyze description, suggest category
3. **Flag ambiguous** items for review (don't guess)
4. **Output**: Categorized data ready for QuickBooks import

### Auto-Detection Patterns
```python
patterns = {
    "subscription": ["monthly", "annual", "recurring", "subscription"],
    "utility": ["electric", "gas", "water", "broadband", "phone"],
    "marketing": ["ads", "advertising", "facebook", "google ads", "meta"],
    "travel": ["flight", "hotel", "uber", "taxi", "transport"],
    "meals": ["restaurant", "cafe", "food", "just eat", "deliveroo"]
}
```

### Rule Generation
When new vendor encountered:
1. **Analyze description** for clues
2. **Suggest category + VAT**
3. **Generate Booke.AI format rule**:
```json
{
  "ruleConditions": [
    {"ruleType": 10, "value": "-1"},
    {"ruleType": 1, "value": "VENDOR_DESCRIPTION"}
  ],
  "ruleActions": [
    {"actionType": 0, "value": "CATEGORY"},
    {"actionType": 4, "value": "VAT_RATE"},
    {"actionType": 5, "value": "VENDOR_NAME"}
  ]
}
```
4. **Add to VENDOR_RULES.json**
5. **Confirm**: "Added rule: [Vendor] → [Category] @ [VAT]"

### Learning Mode
When categorization is corrected:
1. Update rule for that vendor
2. Re-apply to similar past transactions
3. Log learning for future reference

## n8n Integration
Trigger categorization workflow:
```
POST http://localhost:5678/webhook/categorize-transaction
{
  "date": "2026-02-05",
  "description": "PAYMENT - Google Payment Ireland Ltd.",
  "amount": -2.99,
  "account": "Revolut Pro"
}
```

## DO NOT
- Categorize personal AIB 1195 transactions as business
- Guess on ambiguous items - flag for review
- Forget VAT on applicable transactions
- Mix income and expense categories

## DO
- Auto-categorize all recognized vendors immediately
- Apply Irish VAT rules correctly
- Generate new rules for new vendors
- Flag items needing human review
- Maintain audit trail of categorization decisions

## Output Formats
### QuickBooks Import Ready
```csv
Date,Description,Amount,Category,VAT Rate,Vendor
2026-02-05,Google Storage,-2.99,Dues and subscriptions,Standard,Google Payment Ireland
```

### Booke.AI Rules Export
```csv
Rule Name,Condition Type,Condition Value,Category,VAT,Vendor
Google Storage,Description Contains,Google Payment Ireland,Dues and subscriptions,Standard,Google Payment Ireland Limited
```

## Example Flow
```
User: "Here's my Revolut statement for January"

Claude:
1. Parses CSV
2. Matches 45/50 transactions against known rules
3. Auto-categorizes matched transactions
4. Flags 5 unknown vendors
5. Generates suggested rules for unknowns
6. Says: "Categorized 45/50 transactions. 5 need review: [list]. 
   Suggested rules for new vendors - approve to add?"
```
