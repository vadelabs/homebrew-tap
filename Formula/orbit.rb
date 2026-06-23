class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.06.23-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.23-1/orbit-darwin-arm64"
      sha256 "f265947a908bcb4efdded22d2d5d23b5bffb3ff50bdbf52a1b7d06ae32ccefff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.23-1/orbit-linux-arm64"
      sha256 "878d409c258b3742d4621f7cef18002a81ef00a24976ecef86ff6b2b3240332e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.06.23-1/orbit-linux-amd64"
      sha256 "04cd00a1c81dceedd4ae48ecb7519768e086260663d955fcf0ba337a97f17fa2"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
