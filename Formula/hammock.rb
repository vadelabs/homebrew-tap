class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.20-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-3/hammock-darwin-arm64"
      sha256 "d51f748e263564e1811cfdf7abf8cac7ae2c09528f08a321d009a58a4cf0c9c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-3/hammock-linux-arm64"
      sha256 "570da793fb7c55ccce671632bc026b022b0b42686f01595d6513740c5b430485"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-3/hammock-linux-amd64"
      sha256 "9e796becb5c04fcdaf933937b263b711e85b5708c384840c163c33acc4b7673e"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
