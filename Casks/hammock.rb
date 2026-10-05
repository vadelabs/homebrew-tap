cask "hammock" do
  version "2026.1005.6"
  sha256 "6df78e3ed0048926a80fa56c26f4a29359b1c3e0512a38ae797b526146c53e36"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1005.6/Hammock-2026.1005.6-arm64.dmg"
  name "Hammock"
  desc "Pair, record and edit videos from the menu bar"
  homepage "https://hammock.video"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Hammock.app"

  # Not notarized yet: clear the quarantine flag so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Hammock.app"]
  end

  zap trash: [
    "~/Library/Application Support/video.hammock.desktop",
    "~/Library/Caches/video.hammock.desktop",
    "~/Library/Preferences/video.hammock.desktop.plist",
    "~/Library/WebKit/video.hammock.desktop",
  ]
end
