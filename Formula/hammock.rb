class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.20-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-1/hammock-darwin-arm64"
      sha256 "b3963a3b6b693b9c0ba45c0db91330a7ac0c86b4ab9cf8726df6a39d108a18e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-1/hammock-linux-arm64"
      sha256 "b67b05e6a8af951b4954c53dadc83a6a1dfbbf15537deabbc45090f7441d1f83"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-1/hammock-linux-amd64"
      sha256 "ad33562c2c698168ca2ce9678d9bbea9ecdb517fd19fe4933736166cdc5e4163"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
