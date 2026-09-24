# SCAFFOLD — not yet installable.
#
# The build pipeline is done: inquinity/yatu produces a signed, notarized,
# stapled Yatu.app and a DMG (bin/build.sh --release, bin/notarize.sh,
# bin/package.sh). What is missing is the published release for `url` to point
# at. Before this cask works:
#
#   1. Cut a tag and a GitHub release in inquinity/yatu carrying Yatu-<version>.dmg.
#   2. Set `version`, replace `sha256 :no_check` with the value from dist/SHA256SUMS.
#      Do not reuse a sha256 computed before the released artifact was built —
#      re-notarizing changes the file.
#   3. brew audit --cask --online yatu && brew install --cask yatu
#
# Everything below this line is settled and does not depend on the release.
cask "yatu" do
  version "0.0.0" # TODO: the first released version
  sha256 :no_check # TODO: from dist/SHA256SUMS, for the artifact actually released

  url "https://github.com/inquinity/yatu/releases/download/v#{version}/Yatu-#{version}.dmg"
  name "Yatu"
  desc "Finder toolbar button that opens a terminal at the current folder"
  homepage "https://github.com/inquinity/yatu"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Yatu's own floor, set in Package.swift. Older Macs are served by the
  # openinterminal-lite-inquinity cask, which stays in this tap on purpose.
  depends_on macos: :ventura

  app "Yatu.app"

  uninstall quit: [
    "com.altmansoftwaredesign.yatu",
    # The Finder extension is a separate process and outlives the app.
    "com.altmansoftwaredesign.yatu.findersync",
  ]

  zap trash: [
    # The sandboxed extension gets its own container, which the app does not
    # share. Missing this leaves the icon cache and resolution state behind.
    "~/Library/Containers/com.altmansoftwaredesign.yatu.findersync",
    "~/Library/Preferences/com.altmansoftwaredesign.yatu.plist",
    "~/Library/Saved Application State/com.altmansoftwaredesign.yatu.savedState",
  ]

  caveats <<~EOS
    Yatu's toolbar button is a Finder extension, and macOS requires you to turn
    extensions on yourself. Two one-time steps:

      1. System Settings > General > Login Items & Extensions
         Find "Yatu" under the Finder extensions and switch it on.
      2. In Finder: View > Customize Toolbar, then drag Yatu into the toolbar.

    If Yatu is not in the customize palette, step 1 has not been done — a
    registered but disabled extension does not appear there.

    The first click asks for permission to control Finder. That is how Yatu
    learns which folder you are looking at; it is the app's only entitlement.
    To reset that answer later:

      tccutil reset AppleEvents com.altmansoftwaredesign.yatu

    Replacing a build you compiled yourself? macOS ties both the Automation
    permission and the extension registration to the code signature, so this
    signed build asks again and needs enabling again. That is expected.

    OpenInTerminal-Lite can stay installed alongside Yatu — different app,
    different settings, nothing shared. Remove its toolbar button if you do not
    want two.
  EOS
end
