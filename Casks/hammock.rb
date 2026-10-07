cask "hammock" do
  version "2026.1007.2"
  sha256 "321a16d1779ad556a93786ed728cc9b2e3d3845cffdc984db514a61fcaa4e0bc"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1007.2/Hammock-2026.1007.2-arm64.dmg"
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
