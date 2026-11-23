# substack2md 3.0.0 Homebrew verification

Verified November 22, 2026 (America/Denver). Scope: `snapsynapse/tap/substack2md` on arm64 macOS 26.7.3, Homebrew 7.0.15-148-g7de9ab6, Python 3.13.18 and libyaml 0.2.5.

The formula uses the [published v3.0.0 Python source distribution](https://github.com/snapsynapse/substack2md/releases/download/v3.0.0/substack2md-3.0.0.tar.gz), SHA-256 `c42f2e99d19a5c411ee90c1b5f72fe342f2e9743ebb91ad1174dbbfa4c13ea40`. Homebrew fetched and verified the source and all 16 resource checksums. The cached source was independently hashed against the published release checksum.

The runtime resources match the release's [tested constraints](https://github.com/snapsynapse/substack2md/blob/v3.0.0/constraints-runtime.txt). Obsolete packaging and six resources were removed after checking the active runtime dependency closure. The formula keeps Python 3.13, meeting the upstream Python 3.11.5 minimum.

## Installed acceptance

| Check | Result |
|---|---|
| Formula style | `brew style snapsynapse/tap/substack2md` passed, one file inspected, zero offenses. |
| Formula audit | `brew audit --strict snapsynapse/tap/substack2md` passed after the final installation. |
| Checksum verification | `brew fetch --retry --deps snapsynapse/tap/substack2md` passed for the published source and 16 pinned resources. |
| Source installation | Upgrade from 2.2.0 to 3.0.0 passed. The final formula was rebuilt with `brew reinstall --build-from-source --formula snapsynapse/tap/substack2md`, creating the isolated 3.0.0 runtime. The 2.2.0 keg was retained. |
| Formula test | `brew test snapsynapse/tap/substack2md` passed: version and offline Markdown conversion with preserved content. |
| Installed CLI and module | Both reported `substack2md 3.0.0` outside the source checkout; the shell resolves `/opt/homebrew/bin/substack2md`. |
| Independent offline acceptance | Conversion preserved its input paragraph; missing input, HTTP source URL and concurrency 9 all returned nonzero without producing archive notes. |
| Runtime identity | The package and all 16 dependency versions and metadata locations resolved inside `/opt/homebrew/Cellar/substack2md/3.0.0/libexec`. |
| Environment consistency | The brewed Python's pip checked the target environment and returned `No broken requirements found.` |
| Installed dependency advisories | pip-audit 2.10.0 inspected the 17 installed runtime distributions and reported zero known vulnerabilities. This is not a provenance or security guarantee. |
| Formula identity | The keg's stored formula matches the tested formula byte for byte; Git blob `71206a509b7b1c701122eea4b369b855a62e755c`. |

## Isolation correction

The first installation passed conversion and version checks, but the helper's default system-site-packages setting inherited the host Python's wheel 0.48.0 distribution, whose packaging dependency was missing. The final formula sets `system_site_packages: false`. A full reinstall confirmed `include-system-site-packages = false`, all 17 runtime distributions remained local, and the target environment consistency check passed. No global Python package repair was performed.

## Evidence boundaries

The installation used Homebrew's clean tap checkout at base `7d144a1d424e10322a784ca34affac3054882342` plus this formula patch. The formula blob above binds the installed bytes to the committed formula; the install-time tap HEAD records that base, not a later publication commit. The stale development checkout was left untouched. No other formula was changed.

A separate `brew audit --strict --installed snapsynapse/tap/substack2md` attempt selected the entire installed formula set under this Homebrew implementation and stopped on unrelated ada-url 4.1.1/fmt metadata. The formula-specific strict audit and all substack2md acceptance checks passed. Homebrew also reported this host as Tier 3. Linux runtime dependency metadata was checked, but a Linux installation and other macOS architectures were not tested.

The [upstream release notes](https://github.com/snapsynapse/substack2md/releases/tag/v3.0.0) still apply: dedicated-profile browser capture, renderer execution and rendered accessibility acceptance remain pending, and the hosted guide's nosniff/HSTS warnings remain open. This Homebrew verification uses synthetic offline Markdown and does not establish those browser or hosting checks.
