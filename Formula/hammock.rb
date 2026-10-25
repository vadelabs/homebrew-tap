class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.25-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-3/hammock-darwin-arm64"
      sha256 "7a7c105c7ebe85e580f52c01f496319b4ebfdae993c344e67ea2c510ed464171"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-3/hammock-linux-arm64"
      sha256 "afe0b5dfa91eff823c70e7f0d1d6f5fbcfe02f998e67e76cb4015cfd67a83ba2"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.25-3/hammock-linux-amd64"
      sha256 "e38ad84227660b1147069697d35a27159525f1ba2a8e37f42dc4257ad1a04976"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
