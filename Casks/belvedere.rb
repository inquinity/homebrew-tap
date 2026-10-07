cask "belvedere" do
  version "2.0.0"
  sha256 "fc200f4d737db6f79b7f12ac39ac8319945616f1fc235b921c7c2275a061a5d9"

  url "https://github.com/inquinity/belvedere/releases/download/v#{version}/Belvedere-#{version}.dmg"
  name "Belvedere"
  desc "Hardened Markdown reader with Quick Look previews"
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
