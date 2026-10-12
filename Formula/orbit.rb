class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.12-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.12-1/orbit-darwin-arm64"
      sha256 "c7c2fdceab4dcef17ca26f39b8e3c47e302f7090d88118d55fac4e0c7e6a7ae2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.12-1/orbit-linux-arm64"
      sha256 "5e2d1443ca16f73aae889e3a1865f29c924653515206460d72b66c18f7884024"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.12-1/orbit-linux-amd64"
      sha256 "d02c1b41d28d9426e8ffccc2c1823bcf121a0778787db0b572868504384acb58"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
