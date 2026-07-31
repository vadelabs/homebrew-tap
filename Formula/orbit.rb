class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.07.31-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.31-1/orbit-darwin-arm64"
      sha256 "e3c7b238a1e30e7414923d39ad5173953a8869f130a83c5877809cd216956cfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.31-1/orbit-linux-arm64"
      sha256 "6408eb3f9084e3a262beea5c6b1cc7216d1bda3662f7f60e8e1139c444dde3a5"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.31-1/orbit-linux-amd64"
      sha256 "a59eb72add3d618039d9b32d88a046d6d78bb341acf33cffcba9039c125e9ebf"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
