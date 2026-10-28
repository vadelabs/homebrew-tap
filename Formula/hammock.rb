class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.28-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.28-2/hammock-darwin-arm64"
      sha256 "32cf70cc4ff5fb2f9cf547ba2b74b40f8f60a1bb2af15119599ac35439a6fd27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.28-2/hammock-linux-arm64"
      sha256 "a62556a58b31274865619386f09c7879cb938a34d55276231f316dd1716e0c41"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.28-2/hammock-linux-amd64"
      sha256 "bcede93dd06a8bdde7724e2c1a5d86c73022ca63c2604cc6b1f4005c6e5456d0"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
