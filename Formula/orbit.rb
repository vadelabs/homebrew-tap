class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.22-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.22-1/orbit-darwin-arm64"
      sha256 "e2f6c19e518f6441a42d284903584e0f36f1c07ca96fe3edcd1222cc678d7b41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.22-1/orbit-linux-arm64"
      sha256 "4a108e5a9bd3056f22d12e10fe6f9c40d9dbd3bad9f624584f0d90ab5a25b6e1"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.22-1/orbit-linux-amd64"
      sha256 "d2d0f22598293eda8083114c7835d9fe974e090d0f8f3047080e52efa154bec0"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
