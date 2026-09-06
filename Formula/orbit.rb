class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.06-4"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-4/orbit-darwin-arm64"
      sha256 "175af8ef723e27998380f488d19a503a460fb86989f41c05df7bbd87415e62f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-4/orbit-linux-arm64"
      sha256 "db81963f676ad6536a35adcf55673155d6b7ae2b952186f9b8617b73d7cb558a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-4/orbit-linux-amd64"
      sha256 "9b04ce44dd34e4a9ec5a0794b8698352b9bbeafc89d2b8c39c1596751ef79296"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
