class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.28-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.28-1/hammock-darwin-arm64"
      sha256 "fd3cc426304704ae2e7c3544a7cd8cedef846cfe752d4e36689af6039718a6bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.28-1/hammock-linux-arm64"
      sha256 "9482d1d416445e85dff3342f41d056921b6264104cd0084b917c73d87bc30d86"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.28-1/hammock-linux-amd64"
      sha256 "3d65b46a8cd5bed516c8f1f49ccceb1df8df1b6372624ad9c3c1514c151a5e97"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
