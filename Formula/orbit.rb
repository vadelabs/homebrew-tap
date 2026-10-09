class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.09-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.09-1/orbit-darwin-arm64"
      sha256 "2358601f28adb3b07a9c49278ef22e5d3a02f2697f40908c44b62048c1d579de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.09-1/orbit-linux-arm64"
      sha256 "5ed87562555f3c963475ca36274ed2fc83f9730c562ee2bbe79d9231011a47a1"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.10.09-1/orbit-linux-amd64"
      sha256 "b58965dd55872b7a574e233fd20ff38bdefb0a9141a20cefcd9735dc69596af1"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
