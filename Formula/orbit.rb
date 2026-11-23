class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.23-4"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-4/orbit-darwin-arm64"
      sha256 "3495950376c56df8f197ac26895aee39526a0a8e1f75af664e6dda9a7c80e1ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-4/orbit-linux-arm64"
      sha256 "9d4367b316176b8fcb45c09dd87a5f08f7caf368ae15d60f45d57941b92b5abe"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-4/orbit-linux-amd64"
      sha256 "4e383f836bb8be6e0f8bcbc5f4376e0afce422d30afbbf6bb640485e3cc8d88d"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
