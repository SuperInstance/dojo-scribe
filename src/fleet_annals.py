"""Scribe's fleet annals — the competition newspaper."""
from datetime import date

def write_annal(agent: str, action: str, significance: str) -> str:
    """Record a fleet event with narrative."""
    return f"""### {date.today().isoformat()} — {agent}

{agent} {action}.

*Why it matters:* {significance}

---
"""

def daily_summary(events: list) -> str:
    """Write the daily competition report."""
    lines = [f"# Fleet Annals — {date.today().isoformat()}\n"]
    for e in events:
        lines.append(write_annal(e["agent"], e["action"], e["significance"]))
    
    lines.append("\n## Standings\n")
    scores = {}
    for e in events:
        scores[e["agent"]] = scores.get(e["agent"], 0) + 1
    for agent, score in sorted(scores.items(), key=lambda x: -x[1]):
        bar = "█" * score
        lines.append(f"- **{agent}**: {bar} ({score} actions)")
    
    return "\n".join(lines)
