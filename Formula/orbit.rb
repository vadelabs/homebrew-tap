class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.11-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.11-1/orbit-darwin-arm64"
      sha256 "9824a9a2a8c131664c59820f68562e8367ce3d6c2578583ee9b032c31a9e3b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.11-1/orbit-linux-arm64"
      sha256 "9c61b4c7a4287e52714553ba37a52de5151cadf068c182fbd81ad2a3420e1825"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.11-1/orbit-linux-amd64"
      sha256 "d9d2a1539ae533d2a0478c1c727ae5988dbebba57b15a8eec6dceed81c3841ac"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
