# INDEX ENTRY CREATION

## Trigger
Found something that was hard to find; want to make it findable next time.

## Action
```
call Memory.add_observations({
  entity: "{Project or System name}",
  observations: [
    "Key file: {path}",
    "How to find: {search term or location}",
    "Related to: {other entities}"
  ]
})
```

## Examples
- "Key file: C:\Users\bermi\.warp\rules\00_RULE_INDEX.md"
- "How to find: search for 'rule index'"
- "Related to: warp-config repo"
