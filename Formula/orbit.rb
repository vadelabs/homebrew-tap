class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.23-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-2/orbit-darwin-arm64"
      sha256 "afdc8df3b2a5985d830000e86380b49c3a85aad2413beb7b80183d92f38b989b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-2/orbit-linux-arm64"
      sha256 "e536bb21866ea41bc57123cadaadb43cea42492ef19771c26592a60d0f2f82bb"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-2/orbit-linux-amd64"
      sha256 "6c0fa520ae7b6334a62895bad9328115d1d3e243ccd49a06dc15264f9cd1adc4"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
