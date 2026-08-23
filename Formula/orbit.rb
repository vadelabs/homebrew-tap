class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.23-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.23-1/orbit-darwin-arm64"
      sha256 "7d869f242322395858757839b56e759772c66dd7c19efebac844c9dd68b4267f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.23-1/orbit-linux-arm64"
      sha256 "832ad3ff99ca03e8367725e58356d69ebb3b280391b0a44041cd9b20f3fb3216"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.23-1/orbit-linux-amd64"
      sha256 "d3efdb23c160231426011d63ffaf0c8f32abb751ad2e54597c5e6bacad4501a9"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
