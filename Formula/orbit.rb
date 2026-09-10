class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.10-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.10-1/orbit-darwin-arm64"
      sha256 "7e94fa9a540a667c03acd449c86117a467ed5dc2f9910a1e0b5d38bf09570b06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.10-1/orbit-linux-arm64"
      sha256 "4e01e5a0b05c8e0db83d2b0de48d8bdce1ed16f7a49def8922de727b7105a552"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.10-1/orbit-linux-amd64"
      sha256 "d9ae9a5d7544b683e2858b2fcd037bef3af6ee7d32649108272d45b6e8ca92c2"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
