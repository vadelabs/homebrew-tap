class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.18-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.18-1/orbit-darwin-arm64"
      sha256 "94a518fcebc5e75a25af066e4f8e8808b522c0869b16844cc88e03a8309adb73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.18-1/orbit-linux-arm64"
      sha256 "7822de951c8384e5e62efce9b39c1d23443ea6db60a4b8568e9fd7c84e7a179e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.18-1/orbit-linux-amd64"
      sha256 "140cb945af8636facdfe3ca5302df08fb5367ab6fd9744dfc6b9d7830ba5478f"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
