class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.26-11"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-11/hammock-darwin-arm64"
      sha256 "42acc28e200ca7a5d9bf356e6df361e189867d6131ad4d8ccaf3a72002d8ff61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-11/hammock-linux-arm64"
      sha256 "fbbd914f971bde34aa5b80cfc9d39e0d4bdd921d322cb2a481a89bbf7fb7ce18"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-11/hammock-linux-amd64"
      sha256 "5c3a5469a090aac97caec8411db4f44445e7d52f8bf6583311dedefabe6ac6c0"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
