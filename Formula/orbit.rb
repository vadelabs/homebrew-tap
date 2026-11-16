class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.16-4"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-4/orbit-darwin-arm64"
      sha256 "6b0b0a351fdce36806c76572df281dc14b08a1d7b2c8e8de0f6edeee8dd0aea8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-4/orbit-linux-arm64"
      sha256 "f44c1a06ab073010f8a6db96628c7fb8ccd8a6b3d00d59a88fa918b44dd539ee"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-4/orbit-linux-amd64"
      sha256 "639918d597a47772323effacbf00f8ab2f558d43c6ccd969f1e036cca54ba96d"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
