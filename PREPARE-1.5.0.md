# Prepare Harnessie formula for 1.5.0

Temporary working note. Sam deletes this file before the branch merges to `main`. It must not ship in the tap.

## State of this branch

`Formula/harnessie.rb` is prepared for Harnessie 1.5.0 except for the sdist fields, because PyPI does not yet serve harnessie 1.5.0 (checked 2026-10-06: `https://pypi.org/pypi/harnessie/1.5.0/json` returns 404; latest is 1.4.1).

- `url` is the placeholder `PENDING-PYPI-1.5.0-SDIST-URL`.
- `sha256` is the placeholder `PENDING`.
- The `rpds-py` resource moved from 2026.6.3 to 2026.9.1 to match `harnessie/requirements/runtime.txt` (sdist URL and sha256 taken from `https://pypi.org/pypi/rpds-py/2026.9.1/json`; the sha256 also appears in `runtime.txt`).
- `attrs` 26.1.0, `jsonschema` 4.26.0, `jsonschema-specifications` 2025.9.1, `pyyaml` 6.0.3 and `referencing` 0.37.0 already matched `runtime.txt` and are unchanged.
- `typing-extensions` 4.16.0 is pinned in `runtime.txt` only for `python_full_version < '3.13'`; the formula depends on `python@3.13`, so no resource is added.
- Harnessie 1.5.0 keeps the public dependency ranges from 1.4.1 (`pyyaml>=6.0`, `jsonschema>=4.23,<5`), so no new resource is required.

Two side effects of the placeholders, both expected until Step 2 below: `harnessie/scripts/ecosystem_status.py` reports `source_error: no harnessie sdist version` for the homebrew component, and `brew audit` would reject the formula.

Branch base: this branch was cut from local `main` at 953760f (the 1.4.1 formula merge). At preparation time local `main` was 2 commits behind `origin/main` (0ab7265, the guidecheck 2.0.0 merge), which does not touch `Formula/harnessie.rb`. Fast-forward `main` and rebase this branch before opening the pull request; both are Sam's calls.

`brew audit`, `brew upgrade`, `brew test` and `brew linkage` have NOT been run on this branch. They will fail or be meaningless until the placeholders are replaced.

## Finish once PyPI serves harnessie 1.5.0

Run from the tap checkout on this branch. Each block is literal; nothing to customize.

Step 1. Confirm the release exists and print the sdist URL and sha256.

Literal
```bash
cd /Users/snap/Git/homebrew-tap
curl -sS https://pypi.org/pypi/harnessie/1.5.0/json | python3 -c '
import json, sys
d = json.load(sys.stdin)
sdist = [u for u in d["urls"] if u["packagetype"] == "sdist"]
assert len(sdist) == 1, sdist
print(sdist[0]["url"])
print(sdist[0]["digests"]["sha256"])
'
```

Step 2. Substitute both placeholders in the formula from the same JSON, then show the diff.

Literal
```bash
cd /Users/snap/Git/homebrew-tap
curl -sS https://pypi.org/pypi/harnessie/1.5.0/json | python3 -c '
import json, sys, pathlib
d = json.load(sys.stdin)
sdist = [u for u in d["urls"] if u["packagetype"] == "sdist"][0]
p = pathlib.Path("Formula/harnessie.rb")
s = p.read_text(encoding="utf-8")
assert s.count("PENDING-PYPI-1.5.0-SDIST-URL") == 1 and s.count("sha256 \"PENDING\"") == 1
s = s.replace("PENDING-PYPI-1.5.0-SDIST-URL", sdist["url"])
s = s.replace("sha256 \"PENDING\"", "sha256 \"" + sdist["digests"]["sha256"] + "\"")
p.write_text(s, encoding="utf-8")
print("url    ", sdist["url"])
print("sha256 ", sdist["digests"]["sha256"])
'
grep -n 'PENDING' Formula/harnessie.rb || echo "no placeholders remain"
git diff -- Formula/harnessie.rb
```

Step 3. Audit, upgrade, test and check linkage, as the 1.4.1 receipt did (`harnessie/audits/release-1.4.1/homebrew.json`). The tap formula is read from the local checkout only if the active tap points at it; otherwise copy the formula into the active tap first, as was done for 1.4.1.

Literal
```bash
brew audit --strict --online snapsynapse/tap/harnessie
```

Literal
```bash
brew upgrade snapsynapse/tap/harnessie
```

Literal
```bash
brew test snapsynapse/tap/harnessie
```

Literal
```bash
brew linkage --test snapsynapse/tap/harnessie
```

Step 4. Confirm the installed version, then commit the substituted formula and delete this file.

Literal
```bash
/opt/homebrew/bin/harnessie --version
cd /Users/snap/Git/homebrew-tap
git rm PREPARE-1.5.0.md
git add Formula/harnessie.rb
git commit -m "Update Harnessie formula to 1.5.0"
```

Pushing and opening the pull request remain Sam's explicit acts.
