class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.14-4"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-4/hammock-darwin-arm64"
      sha256 "f2a83c7aeab6e6b5747898ca0cee5d49de0f333784dce1d48d7f1f4c1f02d874"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-4/hammock-linux-arm64"
      sha256 "cd31cf8ad23d51e7451bddd8c6a999b7b93689b09c085072c9aea15f7156d709"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-4/hammock-linux-amd64"
      sha256 "b3e57f52560d970bf13d9df4844c72adaeb947bc024ea90821fd692c9211cbc3"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
