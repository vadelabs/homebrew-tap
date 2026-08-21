class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.21-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-1/orbit-darwin-arm64"
      sha256 "ac3d59078d482b48258172409694ca6cf363b6776760a9595bc2f1bf6f5c2a2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-1/orbit-linux-arm64"
      sha256 "832068c9003ac906613e04b7143206f2830542aaedbebf67b0f741bfa67f3074"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-1/orbit-linux-amd64"
      sha256 "4c06eacb4c063e6caccc685ed139570e6a26296a2d0faf16d109797fe4ce7cb1"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
