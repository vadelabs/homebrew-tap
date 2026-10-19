class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.19-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-3/orbit-darwin-arm64"
      sha256 "5eb8f8f47aee62c8730420ff9114d283b52346015f813e86771e57bd8a5ecec6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-3/orbit-linux-arm64"
      sha256 "38386b6138c9884210cb0cf3a2743838ce5436d6d9b0747a2571062a59a731b8"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-3/orbit-linux-amd64"
      sha256 "86f73fc55174951a81c2f162e2e899c886eef9a9cf28ed9a22a672196df76df2"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
