class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.25-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.25-1/orbit-darwin-arm64"
      sha256 "44c7fab4b805a65c1fb1757e607119a88cbf44eb63117aba8e2d9781e81eab08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.25-1/orbit-linux-arm64"
      sha256 "3947525773a766b599d6896f4e514fea5144c308600a5f6e5a762fdadd28139c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.25-1/orbit-linux-amd64"
      sha256 "1141ff34be446c5c0aff06c5b52576abfe39c46aa0f8a11d543b3de06b77b385"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
