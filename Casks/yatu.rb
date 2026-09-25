cask "yatu" do
  version "1.0.1"
  # Verified against the asset downloaded from the release, not the local
  # build: re-notarizing changes the file, so a hash taken before upload can
  # be stale.
  sha256 "7096f31d1b3a5a68caa30a378e6dd606a1b59b2ab360a89ec05cc89fbe8cc0be"

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

    If Yatu is not in the customize palette, either step 1 has not been done —
    a registered but disabled extension does not appear there — or Finder has
    not picked up the extension yet. Finder loads these when it starts, so if
    it has been running a while:

      killall Finder

    Finder relaunches immediately; it only closes your Finder windows.

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
