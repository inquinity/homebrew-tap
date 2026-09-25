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
    Yatu's toolbar button is a Finder extension that you must turn on yourself.
    Setup instructions: https://github.com/inquinity/yatu#install
  EOS
end
