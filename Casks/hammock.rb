cask "hammock" do
  version "2026.1004.2"
  sha256 "a2e9a0f04a5520abaff52838e14220610f25ec0fc8d5b2b4e6200b1967794bf3"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1004.2/Hammock-2026.1004.2-arm64.dmg"
  name "Hammock"
  desc "Pair, record and edit videos from the menu bar"
  homepage "https://hammock.video"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Hammock.app"

  # Not notarized yet: clear the quarantine flag so Gatekeeper lets it open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Hammock.app"]
  end

  zap trash: [
    "~/Library/Application Support/video.hammock.desktop",
    "~/Library/Caches/video.hammock.desktop",
    "~/Library/Preferences/video.hammock.desktop.plist",
    "~/Library/WebKit/video.hammock.desktop",
  ]
end
