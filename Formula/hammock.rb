class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.24-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.24-2/hammock-darwin-arm64"
      sha256 "6bd8fa8ae8de0f9fcc627ec38d40686f93d0ada50480e2122141ff3c72d6a8d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.24-2/hammock-linux-arm64"
      sha256 "f3d488ebab391591d4fd7900e9ccb3b9008c0c6171a3d6c5042ec66c63df2218"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.24-2/hammock-linux-amd64"
      sha256 "948da4b20f1c371973d96b76ef486bd0ade1e090860bfbf2b2c687048e361dd6"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
