class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.19-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-1/hammock-darwin-arm64"
      sha256 "aa0d7254a26be67a5d870d08aa82c42b5fa55b7d078ecabe27ea9632333b808c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-1/hammock-linux-arm64"
      sha256 "2e4bb52660ee3aaa6ffe466abcb1f51202edc28f9e1b2431be983709dba6a8a0"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.19-1/hammock-linux-amd64"
      sha256 "ef883c99c08a6e1b7b7939fb765d7156f57baad5a4999aca9a03911f9abb4f43"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
