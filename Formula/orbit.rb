class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.13-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-3/orbit-darwin-arm64"
      sha256 "c608b3865961161a808fbc24396bc6d04004deeecbec76b6b000e8a7d06d9528"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-3/orbit-linux-arm64"
      sha256 "72a375d398e1e77db1fb96e61bc332201010e81442485a78bbba7a735910c96d"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-3/orbit-linux-amd64"
      sha256 "62b1cfc5899702c780febddd8b0be77543beecbf76e40902932eb20a1b149b2f"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
