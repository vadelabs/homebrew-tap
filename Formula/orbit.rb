class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.24-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.24-1/orbit-darwin-arm64"
      sha256 "64b5bbc7ba4075660fb6cd9131b8eddf1983f80c65cf5d1dce8ae4f5e62129fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.24-1/orbit-linux-arm64"
      sha256 "cb1cf3d308bbffae21657d11a94baf9252cf84b8adea528ff5e01b72aa33d533"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.24-1/orbit-linux-amd64"
      sha256 "d16d5da86d2606192a7582d0392d6cbca14e9766dbdbd4081072542274afcd45"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
