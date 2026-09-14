cask "belvedere" do
  version "1.2.3"
  sha256 "11f7dacd797c8a45a76e2ff49d38d33721a7cb724669bdfbd13874aff3915361"

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
