cask "orbit" do
  version "2026.1123.1"
  sha256 "153fe91da5a01a84dd05495996b7a80a88d9ede9a70b6c1038cd4af6e9fc465b"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-desktop-v2026.1123.1/Orbit-2026.1123.1-arm64.dmg"
  name "Orbit"
  desc "Explore, build and ship apps from a window of its own"
  homepage "https://orbitapps.io"

  depends_on arch: :arm64
  depends_on macos: :ventura
  auto_updates true

  app "Orbit.app"
  # The CLI rides inside the app, built at the app's version.
  binary "#{appdir}/Orbit.app/Contents/MacOS/orbit-cli", target: "orbit"


  # Everything Orbit keeps on this Mac: the window's place and the sign-in.
  zap trash: [
    "~/Library/Application Support/io.orbitapps.desktop",
    "~/Library/Caches/io.orbitapps.desktop",
    "~/Library/Preferences/io.orbitapps.desktop.plist",
    "~/Library/WebKit/io.orbitapps.desktop",
  ]
end
