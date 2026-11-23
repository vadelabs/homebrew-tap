class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.23-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-1/orbit-darwin-arm64"
      sha256 "acca1c71051eaa8497a9614d06d2417b7a2935b1c0c4b19115d28c1b7c7023f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-1/orbit-linux-arm64"
      sha256 "2f2b2175c5ab2833960c019200eac7d764341ed03cda7dc719a2fba7255b8e31"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.23-1/orbit-linux-amd64"
      sha256 "df8f3fd3463efcdf506e9579c3295ab0c21adb98bc5ab5b3c4dd861f78830e73"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
