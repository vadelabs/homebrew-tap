class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.11-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-3/orbit-darwin-arm64"
      sha256 "140fd8b988712de86b695e9ca3feb35edc3ad98850e0894ec26053bd2b8abfaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-3/orbit-linux-arm64"
      sha256 "8f5504b2309d6b888daaeae1dc689cd9d35c5093d15706033a218050afd5366b"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.11-3/orbit-linux-amd64"
      sha256 "15e6f4b98b1902a2aa7435213e3f51655f31f1d444f4f7ce8e906d8791f111fc"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
