class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.09-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.09-3/orbit-darwin-arm64"
      sha256 "322abe279f9879ee561645ee5c2abae1c942f95c1a317661f3bc93714dcaad83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.09-3/orbit-linux-arm64"
      sha256 "d327fbf96131c2607478f21217261ec8b3a648d10fa553c3d703d7f8f7b39ae3"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.09-3/orbit-linux-amd64"
      sha256 "42919eb4d59f87637c01e28c9b8c3707ce95c2b35ad753deee4e4caacf874865"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
