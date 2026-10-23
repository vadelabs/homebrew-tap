class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.23-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-1/orbit-darwin-arm64"
      sha256 "db974fdf4d5dc0efdd3b2ba0399061987ed0fd609b72429ea8016f6f67c8eeea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-1/orbit-linux-arm64"
      sha256 "448e8ed38a4f7ef35cbcdbe319b3b4e6b82f85079c5762577febe76e260edc53"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-1/orbit-linux-amd64"
      sha256 "f798fd59f8ebc61e8128742622b3b5da3f5050c8f9505e69398b4c2d6ef8ddbc"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
