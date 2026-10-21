class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-13"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-13/hammock-darwin-arm64"
      sha256 "d48a0664cf7c616e9f841950bf48eda9cf32d42c5b414bfd1ef39ccbb179badd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-13/hammock-linux-arm64"
      sha256 "717407c311d97afe90b1bb1edc178e5a0207bf22000ff0a8544f9c42205e061c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-13/hammock-linux-amd64"
      sha256 "882170790c83daf852c09c3e7e52be4f6d75627d19b7841e936346e3d5c9fc80"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
