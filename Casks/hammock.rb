cask "hammock" do
  version "2026.1111.5"
  sha256 "cf49285eca1845b0d33e16d9b716cd660e80fab8167c8baf5b1f168a3aec51c4"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1111.5/Hammock-2026.1111.5-arm64.dmg"
  name "Hammock"
  desc "Pair, record and edit videos from the menu bar"
  homepage "https://hammock.video"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  auto_updates true

  app "Hammock.app"
  # The CLI rides inside the app (tauri.release.conf.json), so one install
  # puts `hammock` on the PATH too. On Linux the formula ships it.
  binary "#{appdir}/Hammock.app/Contents/MacOS/hammock-cli", target: "hammock"


  # Everything Hammock keeps on this Mac, takes not yet uploaded too: that
  # is what --zap asks for. The last is the CLI's config and its login.
  zap trash: [
    "~/Library/Application Support/video.hammock.desktop",
    "~/Library/Caches/video.hammock.desktop",
    "~/Library/Preferences/video.hammock.desktop.plist",
    "~/Library/WebKit/video.hammock.desktop",
    "~/.config/hammock",
  ]
end
