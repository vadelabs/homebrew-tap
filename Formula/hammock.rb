class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.09-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.09-2/hammock-darwin-arm64"
      sha256 "26cd03b450f0ececd9af13060905f4e96bf008a97b3053fd66c08ed9331b96c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.09-2/hammock-linux-arm64"
      sha256 "04a0af5a914e95403867e757003a356fbfa85a4ee6600fc8c154e022f8d8d566"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.09-2/hammock-linux-amd64"
      sha256 "f036f41aefe4f1a288712d1ee6dcca1af3622666f2b932e9784dc1a1d6e0781c"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
