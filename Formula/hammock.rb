class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-11"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-11/hammock-darwin-arm64"
      sha256 "4cef8a43ae9121d13d2bf8ac276efdc7db692f70fd8485a215918d6a57d6be99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-11/hammock-linux-arm64"
      sha256 "46e0071a7dca9ecb2d8b5e7d37e4903e2e58c703e2bd735df5dfab6b74055596"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-11/hammock-linux-amd64"
      sha256 "4e40165471ba37c98bef92926fe5642cf38a1a23e6650d735c76e290186fc32d"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
