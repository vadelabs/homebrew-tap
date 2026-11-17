cask "orbit" do
  version "2026.1117.1"
  sha256 "597871c48dda92c39c723b3c702403a12628535ba726bca0604a9393fc99575c"

  url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-desktop-v2026.1117.1/Orbit-2026.1117.1-arm64.dmg"
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
