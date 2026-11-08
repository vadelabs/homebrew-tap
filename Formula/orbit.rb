class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.08-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.08-1/orbit-darwin-arm64"
      sha256 "75e142c2d6d4200d4393be77b6a04d773419e66b5fc016b04374a8f5a0b911be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.08-1/orbit-linux-arm64"
      sha256 "f1a1d84a126829bbc92c3238c987b43294b476103af30b85ac2961d9acab3ebe"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.08-1/orbit-linux-amd64"
      sha256 "80494310f77cc9a72e356cce22306f66d4de2838756c41cd2c7b6bfbbefabb9b"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
