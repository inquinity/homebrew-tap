cask "belvedere" do
  version "1.1.0"
  sha256 "61c0adedf2515b46b3be2e528bc326f898ebb8b25e1a235e03daa716a3fffb4d"

  url "https://github.com/inquinity/homebrew-tap/releases/download/v#{version}/Belvedere-#{version}.dmg",
      verified: "github.com/inquinity/homebrew-tap/"
  name "Belvedere"
  desc "Fork of Markdown Preview with outbound network access removed"
  homepage "https://github.com/inquinity/belvedere"

  # No Sparkle in this fork -- new versions arrive only via `brew upgrade`.
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Belvedere.app"

  uninstall quit: "com.altmansoftwaredesign.belvedere"

  zap trash: [
    "~/Library/Containers/com.altmansoftwaredesign.belvedere",
    "~/Library/HTTPStorages/com.altmansoftwaredesign.belvedere",
    "~/Library/Preferences/com.altmansoftwaredesign.belvedere.plist",
  ]
end
