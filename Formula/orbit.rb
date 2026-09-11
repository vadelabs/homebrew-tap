class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.11-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.11-2/orbit-darwin-arm64"
      sha256 "a7da9535e1116590fcd4163822da307d8ba45d8d0972864b8175b6168dcef48f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.11-2/orbit-linux-arm64"
      sha256 "819e5f11e141629c19ccdfc8d18d65f9929ea00c33069592a22da8ae4b11bb28"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.11-2/orbit-linux-amd64"
      sha256 "9bee410b999237d40ce259a8687c568739b1f1b3b239e45e259dc64f790bbc2d"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
