class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.29-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.29-1/orbit-darwin-arm64"
      sha256 "18d2ad9bbb0bfb1bb7a2821ee556b27ae7962a23a080906964d6e7c22f9ed92a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.29-1/orbit-linux-arm64"
      sha256 "8b2b0d79bb7226fafca488ae7e120a236418f8562c10406cfeccb3d3b2ec97b0"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.29-1/orbit-linux-amd64"
      sha256 "31fc61ba97e329c31b8e74109719ac3489a314128e99c27cb6d9705168b27672"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
