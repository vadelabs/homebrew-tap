class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-3/hammock-darwin-arm64"
      sha256 "5eac1ed1bb497e63f87230ff65aa07d33194cc22f28abe4bea7350ad2bf063da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-3/hammock-linux-arm64"
      sha256 "bd75db4fc7e90334e3f7926a4c7bad0184e4995f1f4511a81e8646f659b64e03"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-3/hammock-linux-amd64"
      sha256 "ce46ff57de108d59c33d66ef7b5adc58b4c3741dc4cf2a7cd57e268c57a73955"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
