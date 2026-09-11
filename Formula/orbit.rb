class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.11-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.11-1/orbit-darwin-arm64"
      sha256 "ec251314b4f1aef241cb9c709903497ba7731a43a8ab49a1a95f1655d691f6e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.11-1/orbit-linux-arm64"
      sha256 "fd8fa3877f4570c25a3051f9d76fc75d4aa243be87038636e91da5b7fb6b4abe"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.11-1/orbit-linux-amd64"
      sha256 "a4d88b5a0a85913c3d58cc9693ed739705a21caeba42377ffc9ed4d07348454e"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
