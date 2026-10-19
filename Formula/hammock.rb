class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-6"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-6/hammock-darwin-arm64"
      sha256 "19d2342ae6cbe8f8b74a6c0bed33086c896d1bbfda245da225c09b3d65b18e84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-6/hammock-linux-arm64"
      sha256 "88d9df37df32447d5ed04b59b627c9624fbf08e6c7a8f4d324e32d3a0e23c9f9"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-6/hammock-linux-amd64"
      sha256 "99109b7aba65177cbb797bdcdee78813494243b4a6bc2b233d222510a248b31e"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
