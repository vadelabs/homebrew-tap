class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.10-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.10-1/orbit-darwin-arm64"
      sha256 "82ec27031913a7e75c3c0d2536d15024a9f40662911acf22b1326bef316dbc04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.10-1/orbit-linux-arm64"
      sha256 "91e2af885078f7159ca092156073cd8d5b189a904e3916d973ee567ab4b85cc9"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.10-1/orbit-linux-amd64"
      sha256 "91c54ac3fb6ce317a535d05799f18a3498ca3f82feb0003348dba5f41ed12408"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
