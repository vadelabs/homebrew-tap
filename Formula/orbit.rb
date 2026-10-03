class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.03-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.03-2/orbit-darwin-arm64"
      sha256 "4adf062f89978802691ca917fb77e851f6499875d401c6567eb90ceb4b26e682"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.03-2/orbit-linux-arm64"
      sha256 "21a56e32c83fce41340e45cb7721bc6337698c9fa2ec353097eb710795c828ca"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.03-2/orbit-linux-amd64"
      sha256 "02249941dc1ccb0834f13314aa2a6845114956e663f667b15915340b832d73f0"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
