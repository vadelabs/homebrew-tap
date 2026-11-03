class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.03-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-1/hammock-darwin-arm64"
      sha256 "f3d8f09b7d540e0fbf1d26ed2758ccc7710eb475aa0a8b1045c9e5525b885892"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-1/hammock-linux-arm64"
      sha256 "af299a7bb9ad8bc06390e7db8b847d3f08758bcf0fd314bdb9b13b7d3a29b14d"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-1/hammock-linux-amd64"
      sha256 "6adada4dd45cf66ed95a8619fb8c2d4ae91f11eb8c7ca83a5588f024831eef42"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
