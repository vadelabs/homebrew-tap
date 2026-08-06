class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.06-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.06-1/orbit-darwin-arm64"
      sha256 "8763cbbb80c93cb569a1df628310eec2e762e9fa3a81d9a03d85300e346e04cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.06-1/orbit-linux-arm64"
      sha256 "b4cb8142eaaab4c3a9fd5bc344af8d9aaefbc7d0b4b87d9dbfe05d03703d9b2f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.06-1/orbit-linux-amd64"
      sha256 "6e1144ca9c005a1d641a0cdeecf550d5ce5b25103197a734b2fbfcb0a2253df1"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
