class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-17"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-17/hammock-darwin-arm64"
      sha256 "13f3f384b190aed763668f3014b659fa2e836505807c1153f64e3256a43ebdde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-17/hammock-linux-arm64"
      sha256 "25e24011a6d83aad759994bfd3b586627bcf6a9b2db2e1d2eb3b612d87da13ea"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-17/hammock-linux-amd64"
      sha256 "413dfa3cd471e66daf943c3d0707d7e30bba2d630299b068d911884bfb81b28a"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
