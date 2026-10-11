class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.11-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.11-1/orbit-darwin-arm64"
      sha256 "d3ea9797f6ef0d3512521236bdc3ae444cc7154336f1a1660b414599773e6471"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.11-1/orbit-linux-arm64"
      sha256 "3f1f5a24949f9b3fe31fe17d98470d29471d13de3aa5c62e78095287ee1e1753"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.11-1/orbit-linux-amd64"
      sha256 "74d169d05688b98e40bb8ebf443e784381da79c4110b849e5d6cf172d4739fbd"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
