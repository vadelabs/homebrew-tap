class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.14-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-5/hammock-darwin-arm64"
      sha256 "c4e07fa8147c51d67a7e395236b17e34384a2d14bb22693ba14ad8c9883e6ac1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-5/hammock-linux-arm64"
      sha256 "9b30916d6c7082e263f2b33ec5bf59197df6e9b3dc6dcee3d92d05fdd7c8c138"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-5/hammock-linux-amd64"
      sha256 "ce4df7898930479f4159c87b404804ec81226af88617353c37e2fb023e117092"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
