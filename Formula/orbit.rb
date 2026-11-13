class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.13-7"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-7/orbit-darwin-arm64"
      sha256 "c28104b7da81a8a9c61eff3b1b17c7eaaec4cd7eccb10041062f53667c6b76dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-7/orbit-linux-arm64"
      sha256 "310515a28077743f2e9c749c8d4ea67b29aeae9379802bf690d205d9ddaa7ffe"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-7/orbit-linux-amd64"
      sha256 "0d7beae93910144207591c7ae10e2d9b227f7152553e417687e23d55686e4abf"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
