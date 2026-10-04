cask "hammock" do
  version "2026.1004.1"
  sha256 "c07b5d95c7f906fa74f7b565ffee65a4b1efd2e85d418a4c20cc538b6ba7b1e3"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1004.1/Hammock-2026.1004.1-arm64.dmg"
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
