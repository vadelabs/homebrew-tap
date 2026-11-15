class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.15-6"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-6/hammock-darwin-arm64"
      sha256 "eee772a1f1043ec8bd8472db41679bc68a233db9581dfc697ca68de977b81470"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-6/hammock-linux-arm64"
      sha256 "49d1fffc8366621d1eb2e7559fce0ae40be8c97ae9326fc842d6e91a8473bcf2"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-6/hammock-linux-amd64"
      sha256 "e702d4076dd967fc6d3b00ae680c2c513b9348dae06f43f22c20f9be8f28e201"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
