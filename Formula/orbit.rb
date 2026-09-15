class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.15-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.15-1/orbit-darwin-arm64"
      sha256 "4a784b7b59b6c013c0bde59e740a8ae622b9f2f0c87dc538f49ce6fca244b289"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.15-1/orbit-linux-arm64"
      sha256 "2c194b4d6cad059854f229f9b1024a8cc3c5d00b7e03b6db22db85acd5f2807c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.15-1/orbit-linux-amd64"
      sha256 "f5f472eab1e1d7f35775115ca0508c1576eb3ac4fc4d5467286eae1e88501b5a"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
