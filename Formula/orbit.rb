class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.21-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.21-2/orbit-darwin-arm64"
      sha256 "9ef0321b4c3f963dc0582e4779be6d56ba0085e7ab1c14dabe1608a30fe0958d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.21-2/orbit-linux-arm64"
      sha256 "31e44502e8ffe0a614cee95b4b794a3474f91ef498507697c30d36b622f61923"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.21-2/orbit-linux-amd64"
      sha256 "30b3aeb98a1434d5dd10c094ce48d751d789794a2368bd5170a3e8daae5d2858"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
