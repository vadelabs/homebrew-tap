class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.19-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-2/orbit-darwin-arm64"
      sha256 "f6bf852f4326f8ebb7dcbe829960b3e9a75f58671014662c85111fa65199ab19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-2/orbit-linux-arm64"
      sha256 "09b55de3f2f2275d1c124d04b74c62f71320d742d650f9ec5a5c4936f615cc5f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-2/orbit-linux-amd64"
      sha256 "b888e5386e64b0967b4dbf3b34ffccdc74c2b200e39fc3c595e58431d05d539d"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
