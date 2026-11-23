class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.23-3"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-3/orbit-darwin-arm64"
      sha256 "fac67d4aab6a02ac357d02c960f9a18b9a6e594312a898f1436ee72719bb080a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-3/orbit-linux-arm64"
      sha256 "0d567417b5bbb6c13b6fa37d80b0de47e2bc84f1798d5671db33a388c74da89f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-3/orbit-linux-amd64"
      sha256 "bf5dc99dc7534e428c3229141d5150cf89c0c89692af41fe72ea3924a8c7b418"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
