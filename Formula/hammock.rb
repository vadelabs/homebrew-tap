class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.20-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-2/hammock-darwin-arm64"
      sha256 "e14fa6dfa799548240fe1b0f0fc1852980565a754fbf7bfe00a431593286c949"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-2/hammock-linux-arm64"
      sha256 "ea394460ebcbc921eb14eccdae1424df65ea9517dd6f1f686625c28b56ed5a1f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.20-2/hammock-linux-amd64"
      sha256 "b82cd260697cc6dd13fd2a0a94796716ff26d0f9cd4757062bd0c463f7d8f1f4"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
