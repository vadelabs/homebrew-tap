class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.23-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.23-3/hammock-darwin-arm64"
      sha256 "81e4bf78be25f55c3e783ffb934dc029565616380fef44c79e30d9c03164a165"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.23-3/hammock-linux-arm64"
      sha256 "14e53c09c634a9d83f8cd40c4b7a12986f737520baa71cb4953b86e45dac429c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.23-3/hammock-linux-amd64"
      sha256 "d6c0598af9f68c59c6c36486d704c8a46d0944a7d3421747a781a3d43e7f6441"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
