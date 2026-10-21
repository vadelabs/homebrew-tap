class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-5/hammock-darwin-arm64"
      sha256 "bf0017c5a29fdeba3cc394fea08c0713b45e7dfab3ff4d9ca5b8b92c7acb6805"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-5/hammock-linux-arm64"
      sha256 "fea64088e4326e8a0a92a3a4c4ae99f7056829efd5993f9cd52643131382c575"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-5/hammock-linux-amd64"
      sha256 "f5c44d9a2bb919136047a7c9ca4883d037aba6e79582480e12466b2bcf1218d6"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
