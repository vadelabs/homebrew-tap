class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.16-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-2/orbit-darwin-arm64"
      sha256 "840f85ffb7af652a0c55f1165b64b5fc32aa3ab2b53ff68ecd7057988d6dd578"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-2/orbit-linux-arm64"
      sha256 "4d8d040080efd1098ff9b4d816c9105e6f18837040c42e6708887c45b7172758"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.16-2/orbit-linux-amd64"
      sha256 "2412f68c3e54f1d0df40c7f49834c253d274b82f3ec7834bd625f8dede215618"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
