class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.21-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-2/orbit-darwin-arm64"
      sha256 "16200e2ad9072f1c393b91ef4390467360a1e1ac3e47366f7c833fef553c36bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-2/orbit-linux-arm64"
      sha256 "9b84a49bdcd4bd6fc3fc9b8b1084069623d7a894de963d38e489558337ca0722"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.21-2/orbit-linux-amd64"
      sha256 "50b417c58d0c6a0f2e737b9c56fd7fd9393f9eedcd2495a174cf4318d6a180ce"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
