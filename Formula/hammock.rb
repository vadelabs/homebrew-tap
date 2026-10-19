class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-8"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-8/hammock-darwin-arm64"
      sha256 "2478c6169e12577c72b91e70f1a6271004df0ac2dae40c0a7cb804f4d93575f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-8/hammock-linux-arm64"
      sha256 "a874a87f76ce1e51830c81717e829becd840416b432355d784d06d8bf45867dd"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-8/hammock-linux-amd64"
      sha256 "fba9d065a44d3b46c591aec45b2236360c98336ea54b7d80035d3a4831e5ff8a"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
