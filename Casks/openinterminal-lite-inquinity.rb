cask "openinterminal-lite-inquinity" do
  version "1.2.8-inquinity.1"
  sha256 "8589e5907cb7e5615c8b2d0fc4809d1d4ef206c9c74998ba867b3a93c764933b"

  url "https://github.com/inquinity/OpenInTerminal/releases/download/v#{version}/OpenInTerminal-Lite.zip"
  name "OpenInTerminal-Lite"
  desc "Fork of OpenInTerminal-Lite with a Finder toolbar icon fix"
  homepage "https://github.com/inquinity/OpenInTerminal"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+-inquinity\.\d+)$/i)
    strategy :github_releases
  end

  conflicts_with cask: "openinterminal-lite"
  depends_on macos: :monterey

  app "OpenInTerminal-Lite.app"

  uninstall quit: "wang.jianing.app.OpenInTerminal-Lite"

  zap trash: "~/Library/Preferences/wang.jianing.app.OpenInTerminal-Lite.plist"
end
