class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.20-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.20-2/orbit-darwin-arm64"
      sha256 "7d7bb96f5990596587ec6139a9e89bd538095711c8b03d7e01509c9009b277f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.20-2/orbit-linux-arm64"
      sha256 "506f09d3fcfb1a6e914661ae9fdc9cdc3fd063096e1795e34cce3dc149012e7d"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.20-2/orbit-linux-amd64"
      sha256 "5adfdd336a722f5b9360ac18fa1ce6d9b98ea1b3270a53d01ec9a8654eacf60f"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
