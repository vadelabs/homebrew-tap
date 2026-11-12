class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.12-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-2/orbit-darwin-arm64"
      sha256 "a161e5a114ef5cdd7046238f590e703cc7bb44472d3fffa271d97af997a74a56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-2/orbit-linux-arm64"
      sha256 "b69d01e588ec1898cd62450640f138ea39ee3e0c8c7dd5c1a6978f7daac754aa"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.12-2/orbit-linux-amd64"
      sha256 "54c1eb22bcb12a83cf37ff26d07bface5e2979b9bbc362f5db07bc55cd662b01"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
