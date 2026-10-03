cask "hammock" do
  version "2026.1003.1"
  sha256 "c24c4d7471bbe9225b124278127251dc248dae4a0fb6e9ea1afa4f97cbac668a"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-desktop-v2026.1003.1/Hammock-2026.1003.1-arm64.dmg"
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
    "~/Library/Application Support/sh.hammock.desktop",
    "~/Library/Caches/sh.hammock.desktop",
    "~/Library/Preferences/sh.hammock.desktop.plist",
    "~/Library/WebKit/sh.hammock.desktop",
  ]
end
