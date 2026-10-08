class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.08-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.08-1/orbit-darwin-arm64"
      sha256 "0a74a727e49a45f6d0d672c4d0f6b832156a9b0a0ee40f469e05382a44048366"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.08-1/orbit-linux-arm64"
      sha256 "010c3cb63d905a16d67de192933a98a3ef296dc8c0d0c717e3b9a551472abbf9"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.08-1/orbit-linux-amd64"
      sha256 "2dfc2a11e17a3b1c6ee670d64b0c3c0845aa1fe5bd96d16b5e0d86c83e340f68"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
