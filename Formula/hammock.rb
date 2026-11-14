class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.14-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-3/hammock-darwin-arm64"
      sha256 "77cb8b736a87eff9edd82ec86905bced61c507f228ae068ac084859fc4ba30fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-3/hammock-linux-arm64"
      sha256 "99c2a3efa8a9186d56997268c0bc4529f813e225cd80557ac0c8b8ead0f885c6"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-3/hammock-linux-amd64"
      sha256 "006eed047d71f2ec7188f768dfcf81695943d92840cba8eace4cbfa655d8ddf5"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
