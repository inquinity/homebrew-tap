cask "belvedere" do
  version "2.0.2"
  sha256 "c423b0c3306ac92d689066ebb1a3a9e4c690c0f6a1c9341a0bf4a61e8ca13cd3"

  url "https://github.com/inquinity/belvedere/releases/download/v#{version}/Belvedere-#{version}.dmg"
  name "Belvedere"
  desc "Hardened Markdown reader with Quick Look previews"
  homepage "https://github.com/inquinity/belvedere"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

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
