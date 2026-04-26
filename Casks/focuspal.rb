cask "focuspal" do
  version "0.2.1"
  sha256 "e268d1d38e14334d7c72e27eea3a0c995c058f0549f9d32f0e82c7c4ae65dd8f"

  url "https://github.com/filippello/focuspal/releases/download/v#{version}/FocusPal-v#{version}-arm64.zip"
  name "FocusPal"
  desc "Hackable AI dev companion for Claude Code (menu bar pixel-art frog)"
  homepage "https://github.com/filippello/focuspal"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "FocusPal.app"

  zap trash: [
    "~/.focuspal",
    "~/.claude/focuspal",
    "~/Library/Preferences/com.filippello.focuspal.plist",
    "~/Library/Saved Application State/com.filippello.focuspal.savedState",
  ]
end
