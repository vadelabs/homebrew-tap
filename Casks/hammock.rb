cask "hammock" do
  version "2026.1006.7"
  sha256 "0af331657ab645f590377ff51b4a2a4b477e24bd7a0102de2f57d4cdc2d5953b"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1006.7/Hammock-2026.1006.7-arm64.dmg"
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
