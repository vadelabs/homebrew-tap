class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.09-6"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-6/hammock-darwin-arm64"
      sha256 "5396b58056015dd2a7412d28738532bf8003f2ba13c85c498025eaac26a624d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-6/hammock-linux-arm64"
      sha256 "26db5be3923395da0f9665ead976ba3732ba93eb6e38b1b0cb2ab7d25c4593ba"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-6/hammock-linux-amd64"
      sha256 "c7b96dda99c52910bf2582de92a4c0bbb38b7a755cf106f9f6f04f76365fe8cb"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
