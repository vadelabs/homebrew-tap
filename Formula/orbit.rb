class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.07-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-3/orbit-darwin-arm64"
      sha256 "f6e1bc31c19f30bc69d91f9e1d30e2a1a32631258092a52dabeb0d1ea65ab8fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-3/orbit-linux-arm64"
      sha256 "4bccdb530ed23e11483cc12f37e1eb584a0eb4a920d6d9f5a1c3166ad71a8a3c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-3/orbit-linux-amd64"
      sha256 "ef749dd6e595a0d5eb6c80cb476db22b164a969a734f09a5f33952bc37db8ff6"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
