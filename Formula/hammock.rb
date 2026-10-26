class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.26-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-5/hammock-darwin-arm64"
      sha256 "a194fa78b7e14916448d2bc3a4d86c48b868947b9994ca8ffd48bceaaf871ffa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-5/hammock-linux-arm64"
      sha256 "031cb0dc2382e92eabe04bf5f8ea1488edc4bc4f6e73df9774673cbda166d41a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-5/hammock-linux-amd64"
      sha256 "1b695dab93515672966249d6681f8d0c7afc4b6525dd79d6eb7b774a0159bdd2"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
