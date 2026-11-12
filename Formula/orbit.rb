class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.12-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-1/orbit-darwin-arm64"
      sha256 "5d0c88a779ed7d47d89729b87a59b696f85725a614a2026cee272861e63a071e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-1/orbit-linux-arm64"
      sha256 "6a5ddff2e58e9e735c77aae754b0faad2c0a291888305f1853b4a03736d416d5"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-1/orbit-linux-amd64"
      sha256 "697ede8f19a003582819f0dc94bf314f8626b52cbda619617b747272f30db16a"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
