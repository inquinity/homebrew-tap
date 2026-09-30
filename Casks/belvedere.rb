cask "belvedere" do
  version "1.3.0"
  sha256 "f27a4ddb6cd65f2f98839b19c7f3033b095d143a2f709ff1be40dd96e1915c54"

  url "https://github.com/inquinity/belvedere/releases/download/v#{version}/Belvedere-#{version}.dmg"
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

  # The app and its Quick Look extension are sandboxed separately and share an
  # app group. The "--DEVELOPMENT_TEAM-" folders come from releases through
  # 1.2.4, which were signed with the group's name unexpanded.
  zap trash: [
    "~/Library/Application Scripts/--DEVELOPMENT_TEAM-.com.altmansoftwaredesign.belvedere",
    "~/Library/Application Scripts/45GJWJVQN2.com.altmansoftwaredesign.belvedere",
    "~/Library/Application Scripts/com.altmansoftwaredesign.belvedere",
    "~/Library/Application Scripts/com.altmansoftwaredesign.belvedere.quick-look",
    "~/Library/Containers/com.altmansoftwaredesign.belvedere",
    "~/Library/Containers/com.altmansoftwaredesign.belvedere.quick-look",
    "~/Library/Group Containers/--DEVELOPMENT_TEAM-.com.altmansoftwaredesign.belvedere",
    "~/Library/Group Containers/45GJWJVQN2.com.altmansoftwaredesign.belvedere",
  ]
end
