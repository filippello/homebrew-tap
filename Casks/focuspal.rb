cask "focuspal" do
  version "0.3.3"
  sha256 "de76840f2651b79f4edc473504dd2cd57c63c35d6bf1adaabb4c486f43fd5b4b"

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

    # Drop the /focuspal slash command into the user's Claude Code skill
    # dir so they don't have to /plugin install separately. Pulling from
    # the pinned tag keeps the SKILL.md in lockstep with the binary.
    skill_dir = "#{Dir.home}/.claude/skills/focuspal"
    system "/bin/mkdir", "-p", skill_dir
    system "/usr/bin/curl", "-fsSL",
           "https://raw.githubusercontent.com/filippello/focuspal/v#{version}/skills/focuspal/SKILL.md",
           "-o", "#{skill_dir}/SKILL.md"

    # Launch in the background so the menu-bar icon appears immediately
    # and HookInstaller wires up ~/.claude/settings.json without the user
    # having to manually open the app.
    system "/usr/bin/open", "-g", "-a", "#{appdir}/FocusPal.app"
  end

  zap trash: [
    "~/.focuspal",
    "~/.claude/focuspal",
    "~/.claude/skills/focuspal",
    "~/Library/Preferences/com.filippello.focuspal.plist",
    "~/Library/Saved Application State/com.filippello.focuspal.savedState",
  ]
end
