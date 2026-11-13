class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.13-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-1/orbit-darwin-arm64"
      sha256 "505fc879a8bfef6730ad4e57cddc46367e274232971d46e6d2886c02db654117"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-1/orbit-linux-arm64"
      sha256 "60df4c01f876e6c63d8a03587cf968c5e3e66b49016cad7b01f7b8c551d51f19"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-1/orbit-linux-amd64"
      sha256 "75aa1699c842d188906c99c071455f9a9f22b8f29a5666c89f0997c336b40e5f"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
