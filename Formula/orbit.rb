class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.16-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-1/orbit-darwin-arm64"
      sha256 "0c6e28f5c0febb888024578726305fac852d77c1a4c6d024589b38299360e757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-1/orbit-linux-arm64"
      sha256 "53af1c7d2b11e5a6a5fce55bebb4b7eca2a72fc505e815e2ca6116a7c089e84c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-1/orbit-linux-amd64"
      sha256 "5a65aeac1f74f647f6db02c6300d21036cef0289a35e1dd1bbd1e8d5183c31a9"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
