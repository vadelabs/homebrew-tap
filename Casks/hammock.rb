cask "hammock" do
  version "2026.1016.1"
  sha256 "7ec2b11c2663fcf42508ccb4796a6c2555d884b57b0479b59ef4f7a9c28ee1dc"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1016.1/Hammock-2026.1016.1-arm64.dmg"
  name "Hammock"
  desc "Pair, record and edit videos from the menu bar"
  homepage "https://hammock.video"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Hammock.app"
  # The CLI rides inside the app (tauri.release.conf.json), so one install
  # puts `hammock` on the PATH too. On Linux the formula ships it.
  binary "#{appdir}/Hammock.app/Contents/MacOS/hammock-cli", target: "hammock"


  zap trash: [
    "~/Library/Application Support/video.hammock.desktop",
    "~/Library/Caches/video.hammock.desktop",
    "~/Library/Preferences/video.hammock.desktop.plist",
    "~/Library/WebKit/video.hammock.desktop",
  ]
end
