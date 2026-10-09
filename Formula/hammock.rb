class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.09-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-2/hammock-darwin-arm64"
      sha256 "54daf143df6faa209201a3d562e33060e89be47956467899e3c4cf41a9ccdf52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-2/hammock-linux-arm64"
      sha256 "ae99626302d03c8cb06b36f4859867eaba93b0c5f5d0fcc9c5b45c124b9856d7"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-2/hammock-linux-amd64"
      sha256 "d09eabe2c5d49937326fd36055ed263d8950788bc15fe3d88ee8888b05b7bb52"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
