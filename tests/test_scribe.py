from src.diary_template import generate_entry, achievement_template

def test_generate_entry():
    entry = generate_entry()
    assert "What I Did" in entry
    assert "What I Learned" in entry

def test_achievement_template():
    tmpl = achievement_template("Scout", "exploration")
    assert "Scout" in tmpl
    assert "exploration" in tmpl
