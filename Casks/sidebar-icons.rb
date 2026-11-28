cask "sidebar-icons" do
  version "0.4.0"
  sha256 "994633aa1ac0276943579471ad303e51c1f9a45d813e74709d91b04d6a720353"

  url "https://github.com/inquinity/sidebar-icons/releases/download/v#{version}/sidebar-icons-#{version}.zip"
  name "Sidebar Icons"
  desc "Custom icons for folders in the Finder sidebar"
  homepage "https://github.com/inquinity/sidebar-icons"

  # Releases are pre-releases until 1.0.0, which :github_latest skips.
  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :golden_gate

  app "sidebar-icons.app"

  uninstall quit: "com.altmansoftwaredesign.sidebaricons"

  # No zap stanza: the icons you set stay in Finder's sidebar, and removing the app's stored
  # configuration would leave them with no way to be reset from the app.
end
