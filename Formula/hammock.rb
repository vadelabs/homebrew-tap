class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.15-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-2/hammock-darwin-arm64"
      sha256 "a32a3d3c6f45358edd680e089d4e8f67e0206eb973378e8e25228f5c6b7a7f15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-2/hammock-linux-arm64"
      sha256 "474d13e5c4591cbb004787507010002d08dc50c41fe6117c58bc741e3fda908f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.15-2/hammock-linux-amd64"
      sha256 "10c6335020c9fb395455103075cd76870d9712ace88867a2b5a1e39e9a949cb2"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
