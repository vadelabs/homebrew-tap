class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.12-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-3/orbit-darwin-arm64"
      sha256 "ee8398da902582df9d2ca39857da0e84c6807caaa6ba5fe0ac2a23209f0f398e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-3/orbit-linux-arm64"
      sha256 "6279ec297d2b690227b86627161e577f210c31811decd28aeed3679983070538"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-3/orbit-linux-amd64"
      sha256 "476ffdbcdf837bb18c62439fedf355b6801f7e58e334d03167fb0ee0ff3155ed"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
