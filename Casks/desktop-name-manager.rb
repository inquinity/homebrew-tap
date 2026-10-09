cask "desktop-name-manager" do
  version "0.1.1"
  sha256 "70e23f2cf2147735a70449d314580ff8ba75a6e87377a4bd8750ef96e9e31bdc"

  url "https://github.com/inquinity/desktop-name-manager/releases/download/v#{version}/dnm-#{version}-arm64.zip"
  name "Desktop Name Manager"
  desc "Label each Desktop (Space) by stamping its name into the wallpaper"
  homepage "https://github.com/inquinity/desktop-name-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  binary "dnm"
  binary "dnm", target: "desktop-name"

  # No zap stanza: labeled Desktops may still show images from the store, so it is never deleted
  # automatically. See "Full removal" in the README.

  caveats <<~EOS
    Labeling the Desktop on screen needs no permission. `dnm --desktop N` needs the
    Accessibility permission: macOS grants it to the whole app you run dnm from (your terminal), so every program run in that app can then send keystrokes and clicks too; turn it off when you no longer need --desktop.

    Uninstalling keeps your wallpapers and dnm's stored labels. For full removal, see
      https://github.com/inquinity/desktop-name-manager#uninstall
  EOS
end
