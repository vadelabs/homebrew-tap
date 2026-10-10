class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.10-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.10-1/orbit-darwin-arm64"
      sha256 "327db1a79c88f7c38539341de11cc0aad54a0cef343e7951d8fdf54b7a2cd694"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.10-1/orbit-linux-arm64"
      sha256 "7fd3dbb3a38e64237eb7395825bf8142ed29524140fae3e1ba4ebda203aaa303"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.10-1/orbit-linux-amd64"
      sha256 "77fa1dc81f94ba658ddb325779f51fe68a72bc982311ffc3972982f483f87433"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
