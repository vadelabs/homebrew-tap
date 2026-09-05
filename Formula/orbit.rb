class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.05-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.05-1/orbit-darwin-arm64"
      sha256 "a7f99ad40bafbb8597ca86903f880a9b11ed7c434f4622d1e4700a3ece06bc53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.05-1/orbit-linux-arm64"
      sha256 "e069366c72bcf2bf951b3f3656912482928fbb0fcf073fb29515dcf88fdf26e1"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.05-1/orbit-linux-amd64"
      sha256 "027a8ae38326b61c53cd53d1ded1ce9023e95884a2cd653fb05e757f67b87d2a"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
