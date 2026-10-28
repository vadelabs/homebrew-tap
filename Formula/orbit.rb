class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.28-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.28-1/orbit-darwin-arm64"
      sha256 "70c3c9290b37c9928d95cc7216b4c2ff085b6fb64020c954fec22e5231eb47cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.28-1/orbit-linux-arm64"
      sha256 "4766bc7890257cade6aa533f0663e59f5f55286a6836cabce6bff6e3d091dcc9"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.28-1/orbit-linux-amd64"
      sha256 "bcabd5826cbc2d1f94b53564f59c84d43d3e62e248c2f7e7ffb129a9ec9e83ca"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
