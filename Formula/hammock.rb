class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.03-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-3/hammock-darwin-arm64"
      sha256 "ea9bfb6defe50554339ea9cf4a6722b99399617c962f8c6448db62ca871413ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-3/hammock-linux-arm64"
      sha256 "43895d075b89ff821d21dcc9183137679b72e2de04d863ba162beeb41b0aef3e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-3/hammock-linux-amd64"
      sha256 "1420bce17ab2ea0f78b91c7349095b95aa79d43bad9d3e2c008d61e8af59f867"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
