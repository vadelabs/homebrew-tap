class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.03-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.03-1/orbit-darwin-arm64"
      sha256 "2217eadfa81304c1928be081c38e7ef61f16134cd99fafd082d30f951b6bceb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.03-1/orbit-linux-arm64"
      sha256 "8ecd74658a67b57f48c592ac045414e86b527e2e137d9141daa1fe08b82f6df6"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.03-1/orbit-linux-amd64"
      sha256 "2ed1565bb45da1a827a71372684037908f8846d2bbfe1a23e782788f98b0e17c"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
