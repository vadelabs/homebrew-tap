class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.14-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.14-2/orbit-darwin-arm64"
      sha256 "15e7728acf464a5135acd1dd526a6ec4159d41a6a88d9c98d38180eb7d8ff40c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.14-2/orbit-linux-arm64"
      sha256 "0bc580a56864bb4396f33eb6aaaee78823cf3057b6c3602d65b14324f080fcc3"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.14-2/orbit-linux-amd64"
      sha256 "a07cdfb2b250bda4e4673f9c7a118673742d97f36ecf3429bd365ac3adeb3293"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
