class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.06.25-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.25-1/orbit-darwin-arm64"
      sha256 "f878d8ae9048140657aa687fafc4ae3652a3ec6f7cc4a10f58ab614e14480ca3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.25-1/orbit-linux-arm64"
      sha256 "91ff10cdc78c5e9ea87e18ea364ee8a7b83ec6d85cb6b26b9272ae43ab5fa4ed"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.25-1/orbit-linux-amd64"
      sha256 "73419793a8fa99405e8e06e214d3a969c3e68b281f0a01e16bef6d5b1830cec4"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
