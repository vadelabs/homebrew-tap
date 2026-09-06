class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.06-5"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-5/orbit-darwin-arm64"
      sha256 "c52b7801778652fb89563c1a9ad1be567a9dbb55daaf328659937c95b4fe332e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-5/orbit-linux-arm64"
      sha256 "bec945e9ca3380be3bb14d415d8e068e634c41bd3a16af65d8226159b1da8fd7"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-5/orbit-linux-amd64"
      sha256 "60c8fd7dcc50fc9d09c3c6e8e73946d3ede23680f9277910535f51c2acd06721"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
