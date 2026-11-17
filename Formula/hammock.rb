class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.17-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.17-1/hammock-darwin-arm64"
      sha256 "e8c0bf02864050fb0bc1b806e9edcc487ec15c1c3432220c2405bce1ce1dc737"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.17-1/hammock-linux-arm64"
      sha256 "4a671cf641f520f7b29d16fd791e6396ea003aa40fd6f9bb2e5c761df3655548"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.17-1/hammock-linux-amd64"
      sha256 "957c2b4d2db4c49d35185adc3e19027b17005767c5ca30aea79ee97b07631d36"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
