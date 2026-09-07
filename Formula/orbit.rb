class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.07-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-1/orbit-darwin-arm64"
      sha256 "8cda67cd3428e2a414803b0478ebdfc72e38dd9f656e7c95cb2160a20d7be967"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-1/orbit-linux-arm64"
      sha256 "533f7875c48b4a327c33d98ea04ca9522065455b85e549549018681a435d1501"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.07-1/orbit-linux-amd64"
      sha256 "3ab7eed1ecf29d26390fe56f0bb11143f0313ddaf7dffb82dce0a1253e09569b"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
