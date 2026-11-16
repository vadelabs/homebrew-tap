class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.16-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.16-1/hammock-darwin-arm64"
      sha256 "c1a346e5a8170c7097885968f3f4f9d8ec0838a020cb907702c1329ddfdbb26e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.16-1/hammock-linux-arm64"
      sha256 "1d12519d832e950d6f6276ef83d9bcb8641d22af6bd55c9d081bcb9e8b638a3e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.16-1/hammock-linux-amd64"
      sha256 "c86510697e4fcfcfa5ac1ad7cc99300d8476cdf38c045809bf00e5ea3aabc656"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
