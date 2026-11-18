class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.18-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.18-1/orbit-darwin-arm64"
      sha256 "20f13d4e29b67bcfa321fe039df17b5ab1918ab3cb290457cfa30dbe4e36a71f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.18-1/orbit-linux-arm64"
      sha256 "c83023e9df8a97c57ddce5108d1bffba04066fbb959eeefc4270efd479d661c4"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.18-1/orbit-linux-amd64"
      sha256 "a24ee8bb948eaaccbf9610f0d07365166db9b139cd1fe39840de7d6416550ce0"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
