class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.12-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.12-1/hammock-darwin-arm64"
      sha256 "7b7a451c610ce2e25e5dde3d86ccefff1b3a38ead5587332f262d2f6c84ba6b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.12-1/hammock-linux-arm64"
      sha256 "3e3ef06a6aa7bf7f71fca28fc0f24d36d35c82a9b585e9340ab7fa94cf13e528"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.12-1/hammock-linux-amd64"
      sha256 "3daa5c8aa16ef3c92ab024bd4daed04fb1a71fff19729f98a9336638c5950304"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
