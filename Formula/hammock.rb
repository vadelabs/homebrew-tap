class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.25-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-1/hammock-darwin-arm64"
      sha256 "bcf66749440fd95d6b1f4734da86a9bb0de3ab4ad13eed4387ad95793bb99de1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-1/hammock-linux-arm64"
      sha256 "5f3fe094de63502f0642fef1e370759830e1e9843fa4b599894c75777da7616b"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-1/hammock-linux-amd64"
      sha256 "cca2e5283e7c7189b449dc91d470051487cff8dbec4aa4678ea4e647eecb9185"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
