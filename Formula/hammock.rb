class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-2/hammock-darwin-arm64"
      sha256 "5d9bfc8a8706e767b1e4c6252c35e47a59a55c154af40183bcd49473ac1730c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-2/hammock-linux-arm64"
      sha256 "a902ecf924cdeb95a1b2ef241ecea01a0a4cbb5e0ab35999707a9a8fc159e256"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-2/hammock-linux-amd64"
      sha256 "3ce11c8c4f95afdc4ea556d778dd3fe5f4f0982d5f65a004f15ce52c0a66290d"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
