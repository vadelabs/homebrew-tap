class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.15-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-5/hammock-darwin-arm64"
      sha256 "0bf7714f31d57f42f466a632463ab7631e9a69715382ca2b58fd9ab71ce979ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-5/hammock-linux-arm64"
      sha256 "29a9007b3e6e7ebfb323174a779183f6dd58eb556f8e6fc90ea036e7fe64a712"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-5/hammock-linux-amd64"
      sha256 "a7ff4e9b914dedf1b82a9a4295b4e908fc1a942910cfcf6a8010eb096afb8db7"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
