class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.29-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.29-2/orbit-darwin-arm64"
      sha256 "b7a360d9d38c1e9c67203362c60746939a3e2f0f80a7ded9dd556c92016cfb55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.29-2/orbit-linux-arm64"
      sha256 "06754563af7e4fe08bab2de7d7365790d26e4c7da6d1af234f6ab336e697410b"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.29-2/orbit-linux-amd64"
      sha256 "3e499150526b8f5d92596c57be102cfe88a31324d13d89d9db563ff6f2cdd008"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
