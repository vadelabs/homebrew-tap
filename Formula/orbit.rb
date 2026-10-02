class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.02-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.02-1/orbit-darwin-arm64"
      sha256 "988d84992f15395ff347dcb14fb1a7eca9d4f7e943b8321befe7b146f606f180"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.02-1/orbit-linux-arm64"
      sha256 "a4078344ef1abe4209a57817f38cfeff74e34f18759a7661826e95b12b53114f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.02-1/orbit-linux-amd64"
      sha256 "0652d03d9553c678aa0bbde3555276ff00c96dcfc52b285608efcfd59311fe57"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
