class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.16-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-3/orbit-darwin-arm64"
      sha256 "a989676c84efc4b900254ea092f27bfe59c9bb6ba20e0a18b51686b6e0016a33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-3/orbit-linux-arm64"
      sha256 "ab43c41de49424ed36da4a4ef09e566378013ba1c4b341cc50e2e370fb897c84"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-3/orbit-linux-amd64"
      sha256 "568c1582a2f844e43b2925da8fb0f98a53d03c424d8a2c8870f443b33ca2a590"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
