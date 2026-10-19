class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-3/hammock-darwin-arm64"
      sha256 "6187c90a4f34f7e7920f91f88c1833f4bc345beecf14c85ec2b73f90d150c0c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-3/hammock-linux-arm64"
      sha256 "eab678cf2d2ea864706c4a79a8fbe7fa09845163c5a3a22d0471b1b1a890fbe2"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-3/hammock-linux-amd64"
      sha256 "03a027222fd39aa7663558bda66975c18571791316cbc0f0aa3f442c1fe200d5"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
