class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.23-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-2/orbit-darwin-arm64"
      sha256 "22679ba900b63819ba4dcf4313f08aeab509c4efc3443f28cada961d00086c2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-2/orbit-linux-arm64"
      sha256 "646e6e1f05183d122143198ebdb2ebbc9aab5d2095e18c73bf64b0e35f7a543a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.23-2/orbit-linux-amd64"
      sha256 "fa610f6cb817e3134c2cb76f7fa94ed0254a796be8816a4cfcc462d27844a664"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
