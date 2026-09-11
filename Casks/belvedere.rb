cask "belvedere" do
  version "1.2.0"
  sha256 "bad5b52950a7c56029ebacbeb65285f709fce21db4fa14f992583e813dc6fbe4"

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
