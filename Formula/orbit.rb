class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.13-4"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-4/orbit-darwin-arm64"
      sha256 "2eece8136ea5b8b9c8820adae9d9ab9cf73c9ba1c037d112f15d5de4f8d2e263"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-4/orbit-linux-arm64"
      sha256 "6c5a90fd11252aa2e265496fd60b565aa1432e19cf9a6fd5d7e91c154b9ab829"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-4/orbit-linux-amd64"
      sha256 "77f5ca09a2ce3df4c153ab447269cdaba35184d4c46f756b56d3364fb7f7374e"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
