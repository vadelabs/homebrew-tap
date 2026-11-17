class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.17-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.17-2/hammock-darwin-arm64"
      sha256 "22bb712f191af238f6ab962b3b4fca5508f025b1b7c98135dca25267c0633d43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.17-2/hammock-linux-arm64"
      sha256 "20b1ebf7ba78e6c514bff138161dbe2fb7b3978519d056e74d816d886c8d0567"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.17-2/hammock-linux-amd64"
      sha256 "82beab6e409a07b526f97c8369ea9e86c953f3a9da04d4facf458e4ffbd4b6e8"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
