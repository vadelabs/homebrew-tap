class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.26-9"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-9/hammock-darwin-arm64"
      sha256 "0e1e48b797991e4d7e01eb1e8811c909cf7d46afe9b5b01b41dbd398d254bd6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-9/hammock-linux-arm64"
      sha256 "53bf750cada4d98eb72dc4c3249898c26bb18a8d6ff0c1a4d0778dfd21a7be9e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-9/hammock-linux-amd64"
      sha256 "b2c270f334c2e754984d623b433b29efd24b16beddc12c444a6ff0177508de6f"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
