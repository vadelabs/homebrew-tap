class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.06.22-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-3/orbit-darwin-arm64"
      sha256 "9fd607ac8695c6fc268cd8603f1ed02bdb1dd627617352d9116bf0c47a6221e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-3/orbit-linux-arm64"
      sha256 "d627a879fb9271101a6eeac14b645547c0c8bec166af354999926d7b5aa89da6"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-3/orbit-linux-amd64"
      sha256 "3cc57305e46a08939f06d5c53faa52cf96d5ece6343444413895101324e908c4"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
