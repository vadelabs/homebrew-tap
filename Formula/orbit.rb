class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.31-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.31-1/orbit-darwin-arm64"
      sha256 "76c65f4d30e7d3b843a7658f485eaedb1e081bacbca99a52364e8ed41db88132"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.31-1/orbit-linux-arm64"
      sha256 "0060d075b32aa017fca8f59464b81cfd348130c9e92cb394322cbb8677f7e4ca"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.31-1/orbit-linux-amd64"
      sha256 "e4156b1f870ebc3742e0e0ac1869a56171a3f314d72f283426bb05f6188f2c1f"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
