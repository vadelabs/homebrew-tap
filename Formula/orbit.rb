class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.01-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.01-1/orbit-darwin-arm64"
      sha256 "1392ba40b2449057c94e0a98e802abb9a1e28fefd9670494e45e7ade4dbfec0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.01-1/orbit-linux-arm64"
      sha256 "502f22a56b489043820ebf0156b59670495895ad8b3c6970935575c75f6db0b9"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.01-1/orbit-linux-amd64"
      sha256 "9be4637206ba61113dbd91f4952d6e196a9e613b07ac73accefe4477578aede6"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
