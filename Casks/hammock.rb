cask "hammock" do
  version "2026.1008.2"
  sha256 "63f9539a20e81b31ca973725a598daa62a21b72434050321c5ee63631692ffb4"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1008.2/Hammock-2026.1008.2-arm64.dmg"
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
