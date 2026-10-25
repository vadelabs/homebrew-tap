class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.25-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-2/hammock-darwin-arm64"
      sha256 "922e24dd53b1f67ca69297bdfb0483467389eeec77db042f2d2fabbf8abbefc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-2/hammock-linux-arm64"
      sha256 "fc73b3d658fdcf445eb23c0854316ea307520943e692054d37d4f2224f404517"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-2/hammock-linux-amd64"
      sha256 "114a94ecb9d8d0ea0ff45bc5d885b922bb7b89a052d0e2417c79baa37a7ea50c"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
