class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.03-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-5/hammock-darwin-arm64"
      sha256 "79aa51d8b6c009a33f19aded90e114dfa3fa18f85a0637df613bd12e96f53c59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-5/hammock-linux-arm64"
      sha256 "12fdffa6866738761907ba6757e9eff1bea24b2adaa216404db701b157d11a18"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-5/hammock-linux-amd64"
      sha256 "7d7591a4e7bd35835890d6fcb6f08adc6d7f7ee4ff8cd7bffd4878b6357b6167"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
