class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.21-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-1/hammock-darwin-arm64"
      sha256 "abf2570e7f289dae0ca43f0aa753d7a5a0a39633a6ce94fdfff3b3f630bf36b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-1/hammock-linux-arm64"
      sha256 "13d1bdc473e7e6c31c9da0df8224c7077929a071736ca8ebf611642fe8149df3"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.21-1/hammock-linux-amd64"
      sha256 "97ff18f9434f1c41152cad6d71c886cc98a90b24642b8cbe6c680f388644427c"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
