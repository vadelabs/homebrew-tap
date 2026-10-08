class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.08-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.08-1/hammock-darwin-arm64"
      sha256 "6cd25cffe06b2c2552ab06290b77c3b74102a3b189220c286313fefdd15f3060"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.08-1/hammock-linux-arm64"
      sha256 "d5595a1f8854001e0cb527fe4f12f7652bb4cd1e9c60e0cddabf3889e2447e09"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.08-1/hammock-linux-amd64"
      sha256 "ea8c49a6ab6636ee99ac0a2475e6c6aa2e5185460221bbd651a5eba2a7a3ac28"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
