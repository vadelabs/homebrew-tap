class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.09-3"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-3/hammock-darwin-arm64"
      sha256 "5ef2fb9992ddb2d708bf0655e7f999903a172191d2ff095ae8814ea2013af5f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-3/hammock-linux-arm64"
      sha256 "f515ea00ad00a8d96bd5f2ab428c5319632ef682812981d6c0baa02d5acd216e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-3/hammock-linux-amd64"
      sha256 "46b786b50226d569ce7c46edbe40e53b466545db3e726e30d32a61e5a5f1796b"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
