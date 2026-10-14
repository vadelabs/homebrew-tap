class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.14-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.14-1/hammock-darwin-arm64"
      sha256 "889f164bf1b0c949055dacb185cc863abaa67894799b0c92f8833c12587e2a84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.14-1/hammock-linux-arm64"
      sha256 "07fb9debaae6f83fcc80996fb82bdceaa65cb188679843a01e9ab89680af56d1"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.14-1/hammock-linux-amd64"
      sha256 "503f7a45a7acdd41edfdcf0f67ba09e8c20ed777bb29d1aef692aa5941f65fea"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
