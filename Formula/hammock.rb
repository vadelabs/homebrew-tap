class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.14-6"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-6/hammock-darwin-arm64"
      sha256 "1803ba827e01713364d4bdf9b5d2e2b326a0e4255e766fda0a68f1b6e04680f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-6/hammock-linux-arm64"
      sha256 "beae556a8a32c911522991fc64311e2ce51b38c69199351ca238fb201e1e0ae6"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-6/hammock-linux-amd64"
      sha256 "cc267fe19362dc988e96445b1e77d96fea9e7a76373f1494921d7856a4015832"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
