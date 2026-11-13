class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.13-6"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-6/orbit-darwin-arm64"
      sha256 "9b8686ee20671b2745520f9809d4a4c0e5c2f85bf6c332d2ec0953fb41078023"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-6/orbit-linux-arm64"
      sha256 "fbc2bde5afb2e363972d0c418406432143f4ae2bcda55d72cb4d7bc90480a6cf"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-6/orbit-linux-amd64"
      sha256 "08cdd16c6d89becc28ccaa4d44d369087dcecacc08478ebe290d9523c88ce969"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
