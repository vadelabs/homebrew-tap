class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.18-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.18-1/orbit-darwin-arm64"
      sha256 "a5f373090b8ffe0e7a77e0b748014714f9d42b7d6ab75ceeb07f728d08aa8169"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.18-1/orbit-linux-arm64"
      sha256 "3f172d9ce48eb35f5e99622eaf2b119fe7c90bcda7c1258953276357f0277ac5"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.18-1/orbit-linux-amd64"
      sha256 "f1f4eeb4f210c39b30e64c8b380ba364d0e7404811ad62567e7df2ee81f1c809"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
