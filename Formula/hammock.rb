class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.04-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.04-1/hammock-darwin-arm64"
      sha256 "5e6c16cb1876841117cf478db7829e7012d4fb2ecc40d58052da97acc7c2f0b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.04-1/hammock-linux-arm64"
      sha256 "10ecb62bdc66e1bbabe681a24c7b110bc67e38b1ab5c4b254c6d7e9230cf4c70"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.04-1/hammock-linux-amd64"
      sha256 "3ec8be54bff8ea9c7a4682329bd55ec2ee2a831438f5a6c362ce51c0dfce33f3"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
