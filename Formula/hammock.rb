class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-9"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-9/hammock-darwin-arm64"
      sha256 "57d99fd6bbcab6cd387cd85f607fd432714ab1d8b2e7d998f91bc59f09121a15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-9/hammock-linux-arm64"
      sha256 "5bce03872b23258ef36cd9888ac13541a6acf31f0c2abebc270575cfb65b5a04"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-9/hammock-linux-amd64"
      sha256 "a22c642cd396074b1f9bf5f5d63e14fbef00d83ebd84f8030fc129a15f0eae96"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
