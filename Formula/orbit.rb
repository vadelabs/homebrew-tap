class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.20-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.20-1/orbit-darwin-arm64"
      sha256 "fd82c8b61f594bd163c7ded12f7275289d89f1ff94bf8582ac3c673e9448179a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.20-1/orbit-linux-arm64"
      sha256 "99653d676acbd976c6c52fb634a0516772f74f925c1111ef0da62586b8db506a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.20-1/orbit-linux-amd64"
      sha256 "2ae5058296a141c3addb43ad3d85a50ac240b58492da0a9bad950ce7e42a2491"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
