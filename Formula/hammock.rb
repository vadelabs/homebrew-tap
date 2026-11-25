class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.25-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.25-1/hammock-darwin-arm64"
      sha256 "9b597e105e1142b9a305ad748b9d4861c48f528dac547cb40d9215e2abe58daf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.25-1/hammock-linux-arm64"
      sha256 "b31c4b3a703cbc3f5c7ba3580604eaa71bbc9daca848370b1379d812982a699b"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.25-1/hammock-linux-amd64"
      sha256 "972b786d6aa2481056ec78042c1588c92fc63ec341420b3e5827341b7effd1b1"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
