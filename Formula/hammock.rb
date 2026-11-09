class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.09-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.09-1/hammock-darwin-arm64"
      sha256 "3c6fee73d6c3c54ef0f946b88f1d4eba7263b0491f19ce6baa18d4ad83e60e8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.09-1/hammock-linux-arm64"
      sha256 "26288e7e4ea1346347ff5c0ef014fe7e62983f8c0abc99396270279ab0a53aa8"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.09-1/hammock-linux-amd64"
      sha256 "4aa74542d343d86f03dddd9a592fd64cdf79323f595e5b1931972173482950e0"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
