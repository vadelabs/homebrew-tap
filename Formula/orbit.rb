class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.13-5"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-5/orbit-darwin-arm64"
      sha256 "79244a0d651c33e17ef1ba8e7e09a49deea2b5b46cc4cd0cf49404337fa42ecf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-5/orbit-linux-arm64"
      sha256 "0dc48e5ee3c1f7bfb2927b5331b78a2423a8bb2b6d949c52e39f3ac1cd20f277"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.13-5/orbit-linux-amd64"
      sha256 "e385ce593fe8b16949f8b6fcce52a5af4062c2eef3fe848ade5401fbb38e1cae"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
