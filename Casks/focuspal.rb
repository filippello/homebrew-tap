cask "focuspal" do
  version "0.2.2"
  sha256 "80d67a12a9e12b1e1cacdd63aa86b1eb0ab9d2daf019f70b16a1fca9ca3dd461"

  url "https://github.com/filippello/focuspal/releases/download/v#{version}/FocusPal-v#{version}-arm64.zip"
  name "FocusPal"
  desc "Hackable AI dev companion for Claude Code (menu bar pixel-art frog)"
  homepage "https://github.com/filippello/focuspal"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "FocusPal.app"

  # FocusPal is unsigned (no Apple Developer ID). Strip Gatekeeper's
  # quarantine bit on install so users don't have to manually right-click
  # → Open every cold launch. We also re-sign ad-hoc inside the .app
  # itself so spctl is happy that the bundle is internally consistent.
  postflight do
    system "/usr/bin/xattr", "-cr", "#{appdir}/FocusPal.app"
  end

  zap trash: [
    "~/.focuspal",
    "~/.claude/focuspal",
    "~/Library/Preferences/com.filippello.focuspal.plist",
    "~/Library/Saved Application State/com.filippello.focuspal.savedState",
  ]
end
