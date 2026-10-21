class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-7"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-7/hammock-darwin-arm64"
      sha256 "4024dd17512aac0256c002187fc00c25ccb06fbfe36b75fd325ecdd6937e1459"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-7/hammock-linux-arm64"
      sha256 "727666916c4182a5fc0c351a1b3be7d308d4b3f60fb46f36481fb39c9cc96dc6"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-7/hammock-linux-amd64"
      sha256 "68c8b7e1af4182dead141be381a43d3ac555f39d5179e404a26ae37ee5a177b3"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
