class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.15-7"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-7/hammock-darwin-arm64"
      sha256 "211558fb522d3e01f504ee036a40c83c483146548bf51b403c5c902d9812fa87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-7/hammock-linux-arm64"
      sha256 "f7195e58b7616243a147f51ee6578977bdac14e9f04fd3430b7b1a5f9fb6c608"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-7/hammock-linux-amd64"
      sha256 "fef2893ef3f667998a1c065b39822ee88be087e9e1a7002c3b170b18fb1698fc"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
