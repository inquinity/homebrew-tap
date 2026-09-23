# SCAFFOLD — not yet installable.
#
# yatu is still at M1 of its build-out (see inquinity/yatu docs/YATU-PLAN.md); the
# signed/notarized build pipeline (M4) and first release (M5) haven't happened yet, so
# there is no real artifact to point `url`/`sha256` at. This file exists so the cask's
# shape is settled ahead of time. Before this is usable:
#   1. Cut a real release in inquinity/yatu (tag + GitHub release with a Yatu-<version>.dmg).
#   2. Replace `version`, `sha256`, and drop the "no_check" line below for a real sha256.
#   3. Run `brew audit --cask --online yatu` and `brew install --cask yatu` to verify.
cask "yatu" do
  version "0.0.0" # TODO: replace with first released version
  sha256 :no_check # TODO: replace with the real sha256 once a release exists

  url "https://github.com/inquinity/yatu/releases/download/v#{version}/Yatu-#{version}.dmg"
  name "Yatu"
  desc "Finder toolbar app that opens a terminal at the current folder"
  homepage "https://github.com/inquinity/yatu"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Yatu.app"

  uninstall quit: "com.altmansoftwaredesign.yatu"

  zap trash: [
    "~/Library/Preferences/com.altmansoftwaredesign.yatu.plist",
    "~/Library/Saved Application State/com.altmansoftwaredesign.yatu.savedState",
  ]

  caveats <<~EOS
    Yatu replaces the OpenInTerminal-Lite toolbar button. After installing, remove the
    old toolbar item and add Yatu's, then approve the Automation prompt when it appears.

    If you previously granted AppleEvents automation to OpenInTerminal-Lite and Yatu
    behaves unexpectedly, reset it with:
      tccutil reset AppleEvents com.altmansoftwaredesign.yatu
  EOS
end
