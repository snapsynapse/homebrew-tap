# Harnessie 1.5.1 Homebrew verification

Verified November 19, 2026. [PR #7](https://github.com/snapsynapse/homebrew-tap/pull/7) merged at 10:02 MST. The tested tap was a clean checkout of `main` at merge commit `46347bcb5ecd6b4809c0dcf369263539d2439877`. The formula came from `6af94264144cf60159103aa3a1490c7eeb39c31f` and had Git blob `c9147dff82fa8b40edec37cb8fdff4c7da2fd280`.

The [published PyPI source archive](https://files.pythonhosted.org/packages/e8/fa/5320ade9b34bfd2ae0fdb6a2f5d82715b9092f6bf9cfb4e9fa7489a89178/harnessie-1.5.1.tar.gz) in Homebrew's download cache matched SHA-256 `b26dcaed78237219e5408229f88327c335688a3659330f397e0eeb9dc7375c6a`. Homebrew verified all six pinned resources during the install.

| Check | Result |
|---|---|
| `brew style snapsynapse/tap/harnessie` | Pass. One file inspected, zero offenses. |
| `brew audit --strict snapsynapse/tap/harnessie` | Pass. |
| `brew install --build-from-source snapsynapse/tap/harnessie` | Pass. Started with no Harnessie keg or executable in the test prefix and installed 1.5.1. The keg's stored formula matched the merged formula byte for byte. |
| `brew test snapsynapse/tap/harnessie` | Pass. Scaffold, guided initialization, and ownership checks passed. |
| Installed CLI smoke | Pass. Homebrew and the keg's Python distribution metadata both reported 1.5.1. The linked CLI scaffolded a fresh project, guided initialization reported readiness, and ownership JSON returned `allowed: true` with `schema_version: 1`. All six pinned Python distributions resolved to the new keg. |

The test ran on arm64 macOS 26.7.3 with Homebrew `7.0.14-90-g82575d6` at `82575d65f0ce81e33889ad4fc51778e0d38af5ba`, Python 3.13.18, Rust 1.99.1, and libyaml 0.2.5. A separate Homebrew prefix reused cached downloads and copied the host's already installed Homebrew dependencies and matching formula metadata. This verifies a fresh Harnessie keg against those dependency versions. The original system prefix still reported Harnessie 1.5.0 after the run.
