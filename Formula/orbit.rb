class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.14-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.14-1/orbit-darwin-arm64"
      sha256 "2c4b3fa7030932ea30d30453a464d881a82e19fb3daf7993139489034a3ac023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.14-1/orbit-linux-arm64"
      sha256 "64a1a0d5643d0e94f6ab7ef0196ecd24d3cb882f3f005eda6b86915ccac3b449"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.14-1/orbit-linux-amd64"
      sha256 "73529b02efd7e10f180fa1f1757349b75b6447bf1fd906bd7fd60eb92011b435"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
