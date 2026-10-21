class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-6"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-6/hammock-darwin-arm64"
      sha256 "1e1f1a1ec49aaa5e60ceb36b746dc2aa2860709f5f44b8cfa148f29043605041"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-6/hammock-linux-arm64"
      sha256 "683a37c1d6e3c4d0bd3a3ca26fb25c77ae6569e06de50adb4a4571e8494d5167"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-6/hammock-linux-amd64"
      sha256 "4938cb1df3b939c038e8bba8fa71282808fa98fde2fae587a07f821b27cb683e"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
