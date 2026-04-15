"""Scribe's diary template generator."""
from datetime import date

def generate_entry() -> str:
    today = date.today().isoformat()
    return f"""# {today}

## What I Did
- 

## What I Learned
- 

## What Confused Me
- 

## Shout-outs
- """

def achievement_template(who: str, what: str) -> str:
    return f"""# Learned: {what}
## Source: {who} ({date.today().isoformat()})
## What They Figured Out: [your words]
## How I Adapted It: [your changes]
## What It Unlocked: [new capability]"""
