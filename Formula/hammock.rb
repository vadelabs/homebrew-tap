class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.26-4"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-4/hammock-darwin-arm64"
      sha256 "765a55e47d52a871f2ffb0d4813b0a194e02122a2321590c350e45e08fc7bd83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-4/hammock-linux-arm64"
      sha256 "b2ca9ccf914bf8a532a0915cec7c4ec9cf1fc43fa3a9cbfcc3243e105e115387"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-4/hammock-linux-amd64"
      sha256 "e5ef77459f580c4cfe3dc2bad78c0170e95508292628ef07419d4cd1aa0cdd50"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
