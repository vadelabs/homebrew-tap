class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.21-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-3/orbit-darwin-arm64"
      sha256 "ba6a704bad8aa382b06b03aa95b4cfef0c589aa1fa63332d9897840a6251dc83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-3/orbit-linux-arm64"
      sha256 "1e945890d05d61aedf86b9774af14e32ab2aa40068973ba2918e997261ddceda"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-3/orbit-linux-amd64"
      sha256 "690d552336ba8c1acb98ea01832d067f5c2fbf03036eaefc34dc5b42a0cb97f6"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
