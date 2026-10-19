class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-10"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-10/hammock-darwin-arm64"
      sha256 "0ff4e2b2ece467ba1ba8058ee64042e21dc90742719989a66f7c29ec14800e1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-10/hammock-linux-arm64"
      sha256 "cf7405b01bede01bbce3871edd15a84036ef2ba6adf5558abd75d1e20f9ff172"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-10/hammock-linux-amd64"
      sha256 "3649fb5825ae0cd77ccd95ba4b763c499b0d285eda380e5a1ad2ecba9054712d"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
