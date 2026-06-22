class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.06.22-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-2/orbit-darwin-arm64"
      sha256 "a025f34444355dddf9048ebab4d04207d6badd0ce1db7f5186bc662f4c8ec94c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-2/orbit-linux-arm64"
      sha256 "119379f8f047511e8a75cca8359efab14018d52448fe89b1160fdb2cf587d30c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-2/orbit-linux-amd64"
      sha256 "231197351096cd708ab4f8d0c73c5485ffe865c2553af84c6b831d36b3856dde"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
