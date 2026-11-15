class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.15-11"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-11/hammock-darwin-arm64"
      sha256 "d6793538572965c7e4a780a2427293ad24fb44b51507b112cd5042dec8b7e0c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-11/hammock-linux-arm64"
      sha256 "bf1e6d1cf8748a3eaebe06e9668b915433d3a0adc7f7eded3b3545c1484534b7"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-11/hammock-linux-amd64"
      sha256 "bb7c3f7eb4dc8c73a00d0f843265570ae58e8299f0a737d8b17bc2983822de8b"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
