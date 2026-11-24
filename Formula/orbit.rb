class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.24-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.24-1/orbit-darwin-arm64"
      sha256 "81695c96eaa156c900d0bf3fa1cd02a2cb1dd55d2d3edd0c10be3c7fc84330e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.24-1/orbit-linux-arm64"
      sha256 "ad1aaccdaae532d5f15641c5a1beb20b87f41336a2051a126f3408d971f07aa4"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.24-1/orbit-linux-amd64"
      sha256 "cc4900a7ca82ab2a307232f69ae9b6b8bc0d464610249c7147ceef2cacd736a0"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
