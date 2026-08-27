class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.27-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.27-1/orbit-darwin-arm64"
      sha256 "67df15eef21cbf7af652cc6222498f075d424f3875e4cadcebade6dca03a4807"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.27-1/orbit-linux-arm64"
      sha256 "e82cd8b9416986546ef1fc963255d334eb5c46c1a54ef9f813725dffe40be134"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.27-1/orbit-linux-amd64"
      sha256 "56baa6093b2adc66b8dd783c1c749346647f83cd4fcf67aeb2d80971deca28e0"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
