class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.12-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.12-1/orbit-darwin-arm64"
      sha256 "79819521ade09834463a92e1aee84db235ca43a5bc48ec7cd37e08a84a790bb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.12-1/orbit-linux-arm64"
      sha256 "2b76903ec367854bfdadc4d08db9035db5141c61a3aebceb8241d13d49862ae3"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.12-1/orbit-linux-amd64"
      sha256 "d0c098935b76da1f1c35324c05f9eab437a7c17f4ace0e39c5e17729192fcde4"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
