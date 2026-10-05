cask "hammock" do
  version "2026.1005.1"
  sha256 "a37fd72b8cf39412b5dd60a9c3443489b936e83595418ebbaebb5b53395bcbbe"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1005.1/Hammock-2026.1005.1-arm64.dmg"
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
