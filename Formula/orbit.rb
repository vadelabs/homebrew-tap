class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.08-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.08-1/orbit-darwin-arm64"
      sha256 "4078e9fa1a2f4dd772755b7f17ea7390ced36bba99500347cce8977505d81a3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.08-1/orbit-linux-arm64"
      sha256 "63c16d8467c429439886f9dd804fb49db20a2bbe50a88921a191999a0f1fc00e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.08-1/orbit-linux-amd64"
      sha256 "71f688b23323b6c89ccb8220e4efe8d30b37e6806102bfa82b4aeb7f17d7be61"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
