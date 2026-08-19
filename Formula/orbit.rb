class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.19-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.19-1/orbit-darwin-arm64"
      sha256 "eaef83e2b173aee641574db81b6e4c41aa5c3576d3bf53eeda52692710c3ef8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.19-1/orbit-linux-arm64"
      sha256 "70994ebf404dbf2ebb2610c373e7407e93c488132713c052fbc9178cc2d8a81a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.19-1/orbit-linux-amd64"
      sha256 "1d35e56bd9f799d359d530484d6fdae3f3feb5d1124c60a4e320a0dd0bb5808d"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
