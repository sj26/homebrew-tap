# Sam's Homebrew tap

A general collection of personal tools and forked formulae.

```sh
brew install sj26/tap/webcam-settings
brew services start webcam-settings
webcam-settings --status
```

| Formula | Purpose | Install |
| --- | --- | --- |
| [webcam-settings](https://github.com/sj26/webcam-settings) | Keep Logitech UVC webcams at 50 Hz anti-flicker on macOS | `brew install sj26/tap/webcam-settings` |
| [gist](https://github.com/sj26/gist/tree/auth-token-from-git-credential-helper) | Fork with Git credential-helper authentication | `brew install --HEAD sj26/tap/gist` |
| [hub](https://github.com/sj26/hub) | Personal fork of GitHub's Git helper | `brew install --HEAD sj26/tap/hub` |

`webcam-settings` currently changes only anti-flicker, not frame rate or
other camera settings. Its formula builds from the tagged source release;
it does not download a prebuilt binary. Do not run its Homebrew service
alongside a manually installed LaunchAgent. See its repository for hardware
coverage, limitations, and removal instructions.

## Moving from the old taps

`sj26/tools/webcam-settings` and `sj26/forks/{gist,hub}` now live here.
The old repositories remain available with Homebrew `tap_migrations.json`
entries, rather than redirecting or disappearing.

Tap the destination **before** updating the old taps:

```sh
brew tap sj26/tap
brew update
```

Homebrew's update migration changes the installed receipts to the new tap.
The formulae and names are unchanged, so kegs, links, and the running webcam
service do not need rebuilding or restarting. Only installations from the
old taps migrate; a Homebrew/core `hub` installation stays on core.

Newer Homebrew versions may require explicit trust for a new tap or formula.
Review and approve the specific formula when prompted. If you updated before
tapping the destination and Homebrew skipped the migration, reinstall the
affected formula explicitly from its new name (use `--HEAD` for gist/hub).
Keep the old taps until `brew info` shows the new provenance; they can then
be removed with `brew untap sj26/tools sj26/forks` if no longer needed.

## The old Timescale redirect

This repository name previously redirected to
[sj26/homebrew-timescale](https://github.com/sj26/homebrew-timescale).
Reusing the name necessarily replaces that GitHub redirect. The actual
Timescale fork is preserved unchanged under **sj26/timescale**.

For old installations made through `sj26/tap` that contain Timescale:

```sh
brew tap sj26/timescale
brew update
```

The new general tap retains the Timescale fork's Git ancestry, `master`
branch, and root-level formula layout. Existing clones still fetching the
old `sj26/homebrew-tap` URL can therefore fast-forward, and Homebrew sees the
Timescale formula deletions with migration entries pointing to `sj26/timescale`.
Fully qualified old Timescale formula names also route to that tap.

Clones whose remotes Homebrew already changed to `sj26/homebrew-timescale`
continue fetching the preserved fork. If such an installation still reports
`sj26/tap` in its receipt, tap `sj26/timescale` and explicitly reinstall the
affected Timescale formula from there when safe for your database setup.
Do not restart PostgreSQL or rewrite database configuration just to move a tap.

The mailcatcher, postgresql-extensions, git-buildkite, and mirror-artifacts
taps are not part of this consolidation.
