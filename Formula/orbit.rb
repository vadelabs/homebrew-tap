class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.11-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-1/orbit-darwin-arm64"
      sha256 "c54beb0da1f80871df39ce2d78a89ecb51aae70e7eb550e85d2b44daf94a6b06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-1/orbit-linux-arm64"
      sha256 "428391b322114109896997893ee8ed311e159163d99d1c62bbee9dab03bd4313"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-1/orbit-linux-amd64"
      sha256 "03841628f79c212171c2c5092c241881cfc93fe810ce9e11ebcadf9ca17eb74a"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
