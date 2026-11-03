class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.03-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.03-1/orbit-darwin-arm64"
      sha256 "f69867d2ff096a0a65d2903e4fcdb17e29843fe232df262a6de350af05e78588"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.03-1/orbit-linux-arm64"
      sha256 "48b92d46e292487a196904d56502707baa17751c0fa12b82bc2cddd7beb0c12c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.03-1/orbit-linux-amd64"
      sha256 "c8c856b34b13c28edc74ab3cd4c3b8c877588eb8c929d5c61886266726d77670"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
