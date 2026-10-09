class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.09-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.09-2/orbit-darwin-arm64"
      sha256 "5458c23aabfbd0863b2e44f911939e7975a4257277219429eaec3d58cbd94c5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.09-2/orbit-linux-arm64"
      sha256 "003db4959fdd9be6f0119be67c07cf9a161a7b314244e95b7118dfce2c9461a1"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.09-2/orbit-linux-amd64"
      sha256 "b351410658c569ccc907fac5af71e439c7784452bece3b9e765885efcbb3d2b2"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
