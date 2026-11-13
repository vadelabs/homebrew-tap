class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.13-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-2/orbit-darwin-arm64"
      sha256 "dd3cf692399ffa405851dc6f1a8b90f612608f6218d71d74adb4c55c89601eec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-2/orbit-linux-arm64"
      sha256 "de968451091c4a62c70ee161679752a0fab83920fdb3ffe349f1f31f6a03fa96"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-2/orbit-linux-amd64"
      sha256 "2f3bbeeb50255bb697a2c0f2b5dc54d283bbedf97ce8dd11cf73a037c65924ce"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
