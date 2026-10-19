class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-5/hammock-darwin-arm64"
      sha256 "24ee7e8fab86fc55c725d313a4871a6b8e626f6911d3d30b747c6d767a1feb0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-5/hammock-linux-arm64"
      sha256 "c9796a6fb091fb1c982c5f779c324cb2c9c354621432046ba7fd4b732aea45fb"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-5/hammock-linux-amd64"
      sha256 "3f2c1f9aa3b1261636226aa2e9016320bce888eeaa94bc6fc6b0bb830a99bac0"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
