class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.22-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.22-2/orbit-darwin-arm64"
      sha256 "8d22c34666f0e7790534ceef1424d416c256e59d4b40aef93984e73840f88d8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.22-2/orbit-linux-arm64"
      sha256 "92e2450c833923603741bf41ebd8e24f6dc03fe4df1cd32ac91da4e138723f70"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.22-2/orbit-linux-amd64"
      sha256 "43f1a4979f7c9811a5aba494af2b56378a55b3b691b6952d4f8e4d727cd399aa"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
