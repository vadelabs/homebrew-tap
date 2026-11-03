class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.03-6"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-6/hammock-darwin-arm64"
      sha256 "e09f83080f04b6c2c848c5536fd1e9720bca374c4a84802f56d17ea294ed08dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-6/hammock-linux-arm64"
      sha256 "6f2093dd9ef8e1ea11ef34853822d624b002d31ab1f5e227ffc333c626bc7dd4"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-6/hammock-linux-amd64"
      sha256 "d836cc2b6c4f01091f7ba81abdc96c8fdd75612a9ac0ab591c535b1835ca47d9"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
