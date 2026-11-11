class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.11-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-2/orbit-darwin-arm64"
      sha256 "040740178c6a81070023b03cd8d511e64b68ef25a95abc5be76b15fbc972d106"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-2/orbit-linux-arm64"
      sha256 "474c0295085a65b2e7f8089c9d43072ede2b2c31fca9572a6bdc8edefb918f5f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-2/orbit-linux-amd64"
      sha256 "a4f3aedad1a1efc4f12f8db981c5622d8ce3cf47a4d804d6878b532f2bfc959f"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
