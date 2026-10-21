class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-4"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-4/hammock-darwin-arm64"
      sha256 "5b9a48c5c0b21c9ecdf0e5387ee7d931bccd92b76b7940774806312db0af729a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-4/hammock-linux-arm64"
      sha256 "8a3ba14ad3918d765f81c9659ee640b357ab27d77068884f58079309240fd73b"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-4/hammock-linux-amd64"
      sha256 "07858d6f652c50c752603188ffdb2f48dde6918af124108af00c8362574c0279"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
