class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.20-8"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-8/hammock-darwin-arm64"
      sha256 "ba447e1729ebfe6d740f4e11229103a9c3c20bd50723824d12477e83288f39ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-8/hammock-linux-arm64"
      sha256 "8f152687e7472d9507504db31bd17873b717fbeca949fbc477b2bc5ac1da54d5"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-8/hammock-linux-amd64"
      sha256 "bd789cb651b5562d4feb2e72e8b006e7a103ff6600b7b4d5fbff48dd00db8008"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
