class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.30-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.30-1/orbit-darwin-arm64"
      sha256 "931508973b904c7878697092ba7c48dd82262b1469c5bd8b422b89ed4a450a03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.30-1/orbit-linux-arm64"
      sha256 "491ef94ccad8e8d0d90bd8ed532ef5ac3822a23689570deb5f4d24a4ecf0ba22"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.30-1/orbit-linux-amd64"
      sha256 "e577719205862c32fd86de92fc9417b51afba03cd9e3b040d86ef3da868e7031"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
