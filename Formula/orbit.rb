class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.25-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.25-1/orbit-darwin-arm64"
      sha256 "81e517d44c6b0e8d385fd86f6b66700dd03ca50a1258ba2979e71a04b01062b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.25-1/orbit-linux-arm64"
      sha256 "6abec8b726fc78c2e33564adfe169fab08bfd0a9bdb6565d5f9471e17c9989cc"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.25-1/orbit-linux-amd64"
      sha256 "c36fe7017bcb23aa745acf58648f8c58b686485098ddbc7735d78f8255204529"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
