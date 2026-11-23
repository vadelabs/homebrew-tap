class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.23-5"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-5/orbit-darwin-arm64"
      sha256 "980f93b1ceb4825574f79b4e720e241d7bf9598814ccd86cd99f693813e44e3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-5/orbit-linux-arm64"
      sha256 "98ce1dd5f28379b589e6a62566c104cc6fb1d5535f120514fc2700023259d2ae"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-5/orbit-linux-amd64"
      sha256 "0088f7aac9832f9d0bb9a54137e6677e27f458381f450e6d49a3d59def9e8256"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
