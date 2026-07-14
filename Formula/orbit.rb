class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.07.14-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.14-1/orbit-darwin-arm64"
      sha256 "464898300cb4e5b3b35c14a196c2cea4cb87f523d66ecbd513bb3776cc28a592"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.14-1/orbit-linux-arm64"
      sha256 "d8871a7bce51aad4892a39f9aa8fb5eb2d53ca54dfb634751f9e6622ca9c3118"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.14-1/orbit-linux-amd64"
      sha256 "3825d09eb422296e6744681d693698b50b94b5f80278634acc24f0fc19fb01dc"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
