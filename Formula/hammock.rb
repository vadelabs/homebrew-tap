class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.26-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-1/hammock-darwin-arm64"
      sha256 "69a5ba3279af78ebf5dcf7be1f2bd1c7254457e534a83f426e2fbd9c64e1e7c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-1/hammock-linux-arm64"
      sha256 "2ddd79a83fcdf557a70687538e3ec1ae9c07b1f8f845f7267609b95d01a5ad51"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-1/hammock-linux-amd64"
      sha256 "3899df61e789369e8b4586db176c64193714f553dfbcda219601f9904cf52a1e"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
