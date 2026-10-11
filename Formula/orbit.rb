class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.11-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.11-2/orbit-darwin-arm64"
      sha256 "aaa702a4d5fc9b2c83726b80201e42a4c6527e6e5780fbd120c2925ef7e98f79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.11-2/orbit-linux-arm64"
      sha256 "588a2c0fb4c6106420a1837caec5f48623ead1aa30d47f409ea58c7b2364765f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.11-2/orbit-linux-amd64"
      sha256 "9e3d46a7391016434f7da56acb83a9b9d8c8777d9ec725adee13309ebfdb19b3"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
