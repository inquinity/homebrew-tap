cask "belvedere" do
  version "1.1.0"
  sha256 "c215d79e1ca99332c04818055cd4a0e984d39823a59d3d68eec3781a9948767a"

  url "https://github.com/inquinity/homebrew-tap/releases/download/v#{version}/Belvedere-#{version}.dmg"
  name "Belvedere"
  desc "Fork of Markdown Preview with outbound network access removed"
  homepage "https://github.com/inquinity/belvedere"

  # No Sparkle in this fork -- new versions arrive only via `brew upgrade`.
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Belvedere.app"

  uninstall quit: "com.altmansoftwaredesign.belvedere"

  zap trash: [
    "~/Library/Containers/com.altmansoftwaredesign.belvedere",
    "~/Library/HTTPStorages/com.altmansoftwaredesign.belvedere",
    "~/Library/Preferences/com.altmansoftwaredesign.belvedere.plist",
  ]
end
