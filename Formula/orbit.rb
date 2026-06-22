class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.06.22-4"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-4/orbit-darwin-arm64"
      sha256 "ff759cb6122d865b1bc76526461351e3ad7791cfe0dc54828b1f0303f63b132d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-4/orbit-linux-arm64"
      sha256 "e48d21565c91c4dea02e4626e58f602c03ad44334a0cc5b4ca8a9195471166a6"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.22-4/orbit-linux-amd64"
      sha256 "4bbe4d2c6cc56c33fb6c7f28c634d47d83de434cbed22f4740860da43e759276"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
