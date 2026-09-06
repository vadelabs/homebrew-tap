class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.06-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-3/orbit-darwin-arm64"
      sha256 "34a998a07adaee5ee9d04da88c3aacc63004042a213e9bd8d0dce24d5b1db0fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-3/orbit-linux-arm64"
      sha256 "7cd1d98a16a705771a8100ba884c11c5df09ba16a3f373ccdb0adf6e8477798e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-3/orbit-linux-amd64"
      sha256 "e26558e398425545303bc02a206d0f6993c3c3322b65b8b75ccdc5dd0a388559"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
