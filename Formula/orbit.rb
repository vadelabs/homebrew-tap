class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.24-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.24-2/orbit-darwin-arm64"
      sha256 "c0fe156dac9b661594d6fff56b260671ba8ddd1c82baf495d442f522c31dd8de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.24-2/orbit-linux-arm64"
      sha256 "fe8a909657569b4b9a2432475cc59063e55cb913d719f943ffb03b183bec36ec"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.24-2/orbit-linux-amd64"
      sha256 "5e68fd9ac27dd76c57ab4f085c71d84285f462f677630c36df11e9eedc0ad5a1"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
