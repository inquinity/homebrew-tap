cask "qltextview" do
  version "0.1.0"
  sha256 "f3b804d17aaae5c5991cd2cfb96ba24817e48cebec121a321b876dd689c2bca4"

  url "https://github.com/inquinity/QLTextView/releases/download/v#{version}/QLTextView-#{version}.dmg"
  name "QLTextView"
  desc "Quick Look previews for text-based config and source files"
  homepage "https://github.com/inquinity/QLTextView"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "QLTextView.app"

  uninstall quit: [
    "com.qltextview.app",
    "com.qltextview.app.QLTextViewExtension",
  ]

  zap trash: [
    "~/Library/Containers/com.qltextview.app",
    "~/Library/Containers/com.qltextview.app.QLTextViewExtension",
    "~/Library/HTTPStorages/com.qltextview.app",
    "~/Library/Preferences/com.qltextview.app.plist",
  ]
end
