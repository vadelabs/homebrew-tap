class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.12-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-3/hammock-darwin-arm64"
      sha256 "15765a306e6ceb5dd9032d2475bc5663085513d6bc656f5dfb430ae2b64cc6fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-3/hammock-linux-arm64"
      sha256 "0338eda06a0b88bd90685694a07e4ab6d0c66bcef7630009a5966ddd1b950104"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-3/hammock-linux-amd64"
      sha256 "6f69be90e3a39aaa15a192bb3db18cb1e8f67afaf1317e2b5156fbb354c005e2"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
