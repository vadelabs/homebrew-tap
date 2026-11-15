class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.15-4"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-4/hammock-darwin-arm64"
      sha256 "ccde67ef42ffb5b5172159a6b3cf736f9b0ccab1a3a1c5464ee6cc95b740697b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-4/hammock-linux-arm64"
      sha256 "54741f47c307b522b724cf9ed2d6e2d9a3bf7264fe2658c53ec6d3fb50efdb2f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-4/hammock-linux-amd64"
      sha256 "699f7f43091cc2bccea72f8e3e756b33907aad04efb51376acba22ec0f449d65"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
