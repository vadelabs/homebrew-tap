class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.14-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-1/hammock-darwin-arm64"
      sha256 "f990053e920844740fac1311458b5f2ae0680213a556d49ce6875ec5eb4dc959"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-1/hammock-linux-arm64"
      sha256 "67ba5a398cfadb1ef6d4f81dddf12b145a89fc2d4781be321a2dff7b22430c39"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.14-1/hammock-linux-amd64"
      sha256 "15a6c98099a0ab1ae899dcbffd8544895417e48a6b8ca6a34f9e6c2ecfb3062b"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
