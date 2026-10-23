class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.23-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-3/orbit-darwin-arm64"
      sha256 "50577f1cce8be564cd455b88802f2e236bbb8d11e36de93953093f0c3be37daf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-3/orbit-linux-arm64"
      sha256 "f297c1fc461154d831dfb75764e100c69b343f76d2b10553745167638de59b28"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-3/orbit-linux-amd64"
      sha256 "cc7166d012cfcc68ba4752be8fca7c1d2d53cc543715c6a7d2fc84d39aac1767"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
