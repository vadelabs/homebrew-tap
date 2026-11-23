class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.23-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.23-2/hammock-darwin-arm64"
      sha256 "02a4ade0dcdec522a95a1403d745e4bd5d4b1214048e4c3222a1957253561f5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.23-2/hammock-linux-arm64"
      sha256 "6f73aa1c57a542066787adee5b3317e2e1e19dd915263d1207aea29ce3751865"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.23-2/hammock-linux-amd64"
      sha256 "1eb960fd1713486a4beb4b9b09c44e7826d654d930fe7ab248d8a9fcdee5f6c1"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
