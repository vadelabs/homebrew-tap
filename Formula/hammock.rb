class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.12-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-2/hammock-darwin-arm64"
      sha256 "b86655bff883789a3204fc6d4ff1ed77d48007131fa1da181d55bb5a1d659ea7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-2/hammock-linux-arm64"
      sha256 "ff587ccb987873478afd4cc2ecaebd769c8c3699333f4699ae9dc4d4b36398e9"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-2/hammock-linux-amd64"
      sha256 "2572eccf7e98f6c5e39e87bbf37a0b34d21c1784e1eb01eea0647a6976d37303"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
