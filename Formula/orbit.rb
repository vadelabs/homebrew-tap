class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.16-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.16-1/orbit-darwin-arm64"
      sha256 "73c378758299b9edd683e74c1d451a0e97e3d5ea1f869f5436e40ae7dfb860ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.16-1/orbit-linux-arm64"
      sha256 "dee9fad8b669acffd66521770277e71732ad8b95a12767b643573f7da3471594"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.16-1/orbit-linux-amd64"
      sha256 "e9f60aee1b49c25fbbbe2461246b157c89d41a049cae391b7c939c203e156670"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
