class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.19-4"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-4/orbit-darwin-arm64"
      sha256 "ebb8eb613292f4860fe129cc0722ce26548beefb499e373d4d8c90f872d39862"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-4/orbit-linux-arm64"
      sha256 "b8dc210393c8563d0b85ad2e731fa503d068e3b43ce0d5c9919246cc60e714b6"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-4/orbit-linux-amd64"
      sha256 "fc5c61ca2ae58db950bb8fb42f0953193ed74e83bf7cacca6ef09ebea1d6d532"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
