class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-9"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-9/hammock-darwin-arm64"
      sha256 "8fce86dc6cd3e909fed80adebdbf21257bfd101e877cfc0ab1a3da45698fb623"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-9/hammock-linux-arm64"
      sha256 "39e70d310f6487d973374b0dfe3770c9fe19ce6c4dc7a6cdb58ed010f6495f59"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-9/hammock-linux-amd64"
      sha256 "555956489b472f8caec6426eec86a5a3af8d11e50b79d586d16a511f65743772"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
