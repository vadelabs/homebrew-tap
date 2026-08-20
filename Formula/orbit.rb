class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.20-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.20-1/orbit-darwin-arm64"
      sha256 "af4bd2b633294752facf048b93eed54ca2970a6ef98d5a45fe8c00a461f01223"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.20-1/orbit-linux-arm64"
      sha256 "039bc54bbeef0e6fb373ef002c9c6b61aefd8b69ff428cc07a55ed7c35ea49d7"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.20-1/orbit-linux-amd64"
      sha256 "61ed2eadde5f1d71bd4e4c27b94439d2a051767c5cc2b79d4f2b0860c2bc7d07"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
