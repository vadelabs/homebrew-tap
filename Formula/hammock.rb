class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.03-4"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-4/hammock-darwin-arm64"
      sha256 "186ad6d3f7f8c85d5dd5b87f9b996751d843d2e07d597d401415eb1cba9efde5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-4/hammock-linux-arm64"
      sha256 "f16669f8d5118e3ba422e5a28739a07c2104095703bc6bb8183ab3f906ce38f3"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.03-4/hammock-linux-amd64"
      sha256 "5b669026d4d1c5bd3e230d5ad2f0e690defcb184c0d336c89577e3d176f3b1e0"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
