# filippello/homebrew-tap

Homebrew tap for [FocusPal](https://github.com/filippello/focuspal) — a hackable AI dev companion for Claude Code.

## Install

```bash
brew install --cask filippello/tap/focuspal
```

That's it — `FocusPal.app` lands in `/Applications`. On first launch right-click the app and pick **Open** (the binary is unsigned).

## Update

```bash
brew upgrade --cask focuspal
```

## What's inside

- `Casks/focuspal.rb` — the FocusPal Cask formula. Pulls the latest signed-off `.app` zip from the FocusPal releases page.

## Reporting issues

For app issues: https://github.com/filippello/focuspal/issues
For formula issues: this repo's issues.
