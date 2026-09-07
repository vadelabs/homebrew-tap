class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.07-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-2/orbit-darwin-arm64"
      sha256 "58bbef1991d5e9c4941d1d872fe7eb6fe74c8fed2d63415c459a08864ab6e2f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-2/orbit-linux-arm64"
      sha256 "76debbac50b9f527857fb97313cd41ffc3132025fe5af9df85f0eaf35c1f030b"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-2/orbit-linux-amd64"
      sha256 "ee5f48187d5008d88fb79db1f75307794c058a421b0a6339c8579837ed42a7f2"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
