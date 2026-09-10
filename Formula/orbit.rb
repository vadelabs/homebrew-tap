class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.10-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.10-2/orbit-darwin-arm64"
      sha256 "65c88bb5bb1eaa93c4fd4cb6fbc0867953089f07fca2748ed671d261cb3b4ef4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.10-2/orbit-linux-arm64"
      sha256 "e3eb303a39cb16806277a39603dd1a24c688b1dd69e8ca8f5248f8f12e25ce04"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.10-2/orbit-linux-amd64"
      sha256 "06ff0082cb007825531badb34616839921139cb7eb61696368f54cd1dba4d820"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
