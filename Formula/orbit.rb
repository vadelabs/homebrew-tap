class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.24-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.24-2/orbit-darwin-arm64"
      sha256 "f8867897c37c8b2039ede705bb6a085880da14fbcee2fd5b95787bf905979330"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.24-2/orbit-linux-arm64"
      sha256 "d4bb2d79060c2ef680a1fe2a934f56ef9a1c348575cdca7c973c0206d8a55957"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.24-2/orbit-linux-amd64"
      sha256 "eea70caa2f108dae9fa6a0c34a3ead4a2f558b97f9a1d7b0499ad9241d0a22e7"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
