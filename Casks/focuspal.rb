cask "focuspal" do
  version "0.2.3"
  sha256 "166fd902b64e479493aa4f2711e831718b3cd6ff1849a51131cf0541c91488ee"

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
