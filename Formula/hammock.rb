class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.05-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.05-1/hammock-darwin-arm64"
      sha256 "a231693ad7377114601d9820f476b58d545dbc600fad689de197c663c51ff6df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.05-1/hammock-linux-arm64"
      sha256 "c3d50529e65b890f6f5b1efbf7e9e3be6238d39920d11a6bf613c70795aa62ca"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.05-1/hammock-linux-amd64"
      sha256 "afeb1eddacc6161b5e6b137fedce15ec1d7c24262e95599b7b84407f112c10ee"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
