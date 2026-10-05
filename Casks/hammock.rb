cask "hammock" do
  version "2026.1005.4"
  sha256 "77a037a098a2385504ad37e1c1fcad52d4488c4b6461891795e9c9e1ca984af0"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1005.4/Hammock-2026.1005.4-arm64.dmg"
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
