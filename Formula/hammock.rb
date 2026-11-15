class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.15-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-1/hammock-darwin-arm64"
      sha256 "0af03b9a7e2c2ae36409b6dee5de918147cf1c37069e12fec6927f84fc1c3f99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-1/hammock-linux-arm64"
      sha256 "9f0d9b39759b852e3a9a97012bd271fbe187176bedc1808895b1c6e82add73d7"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-1/hammock-linux-amd64"
      sha256 "1ba829c3eae82ebe4eb68ae5474f840519268b917049b161aa5815cd33f5835f"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
