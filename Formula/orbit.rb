class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.21-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.21-1/orbit-darwin-arm64"
      sha256 "28e029286d8f7e7da8e9c51f286b015caf1cfc412388660589706810f347178d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.21-1/orbit-linux-arm64"
      sha256 "734eea35c2719ca1c129e8eb1c68d1f01a8c51d3e0a6f8839c73f3f7d370137a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.21-1/orbit-linux-amd64"
      sha256 "5c93b7298e66b8330427affea50a0806ba404152b6ac1687e2ef14f69cc871e7"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
