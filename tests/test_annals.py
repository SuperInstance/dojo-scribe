from src.fleet_annals import write_annal, daily_summary

def test_write_annal():
    entry = write_annal("Scout", "built a leaderboard", "competition needs scores")
    assert "Scout" in entry
    assert "leaderboard" in entry

def test_daily_summary():
    report = daily_summary([
        {"agent": "Scout", "action": "explored 3 repos", "significance": "mapped territory"},
        {"agent": "Builder", "action": "wrote 5 tests", "significance": "quality bar raised"},
    ])
    assert "Standings" in report
    assert "Scout" in report
    assert "Builder" in report
