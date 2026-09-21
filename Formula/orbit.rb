class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.21-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.21-1/orbit-darwin-arm64"
      sha256 "2cdc70ce0a4ecf9c10b0aa4765eb7416c108f09c5681043412cc724a9a105648"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.21-1/orbit-linux-arm64"
      sha256 "a56dc245c8419045cd628f92e5b61cf1981a48a491a67e2f302e9cef7c8b4f46"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.21-1/orbit-linux-amd64"
      sha256 "72689c27110de8d20438f05cfc2d3819c6daa49b4f34dc6e14ea36fc3a5d23ef"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
