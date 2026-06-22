class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.06.22-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-1/orbit-darwin-arm64"
      sha256 "e41d0989f994627578b2bc6a4f9412581b18d07d1218183c5dbb023ae0b76069"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-1/orbit-linux-arm64"
      sha256 "1829d3a4482d378b8ed6ec4ec71da5e46e31cf8dede0b76333dbccfc3e0f0983"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-1/orbit-linux-amd64"
      sha256 "200c86b6d15e2964aded7913cd54eee161ba40754df69ce0eda43376b565a2f4"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
