class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.20-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-5/hammock-darwin-arm64"
      sha256 "82bc34fff2e471d3ced061d30b1d7c2b26df2697a9f673ac2a1d063e39e130ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-5/hammock-linux-arm64"
      sha256 "72e18bed9893f3832206119ac570fd699c182074cfc1c52e81f04fc7fd24fca1"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-5/hammock-linux-amd64"
      sha256 "3ddb681d2872a671a974fcbbf356bbe2942c5b9643da49513283fe11e4b956cc"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
