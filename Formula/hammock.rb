class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.09-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-1/hammock-darwin-arm64"
      sha256 "000622d715bb993271b4f2c387077d5391e4084bb1284c3a5560447a8c7602ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-1/hammock-linux-arm64"
      sha256 "f28e70181f3d3463ac0a824da084a7e048c948f2a93cabf94517341d53d07e4e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-1/hammock-linux-amd64"
      sha256 "1421b955a0f68cac9ecdbc8f5a04ab83179cfe569d03e8734b74fd515863be8d"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
