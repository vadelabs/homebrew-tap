class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.07.11-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.11-1/orbit-darwin-arm64"
      sha256 "4f1b0875d5850a6a0fcdc4af1d2fc88502e7052296f3bd00d8fcae492d8a082e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.11-1/orbit-linux-arm64"
      sha256 "d3f95252c4b2a7e7e01212406e8a3c9b1a8f006c566d73c160e9dc090116f39a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.11-1/orbit-linux-amd64"
      sha256 "b8a8d36ddd21a56bf025fd0adf22bfbf8858ea947f139fad84017bf15080690f"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
