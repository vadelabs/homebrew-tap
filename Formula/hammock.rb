class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.20-6"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-6/hammock-darwin-arm64"
      sha256 "0e716c79b044bc1773ef5f75c091e451db0d2b5de392f018d63181a4b267a790"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-6/hammock-linux-arm64"
      sha256 "3b05f8edf2f59f40c07def18f1709536f618d8d45a66551f7a15be5631d959f8"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-6/hammock-linux-amd64"
      sha256 "8cf3be1d5ba82f361cd9c958a2a4bdcdbbc20a7722f7645873688445dbf03417"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
