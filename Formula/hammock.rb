class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.22-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.22-1/hammock-darwin-arm64"
      sha256 "ac11af1bf2e40c72bccf23be69de3978778a9835068f188c45658306020161bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.22-1/hammock-linux-arm64"
      sha256 "f5784209b1e478f98e6da8ad7ee0be8c55a693b07d8f3411b931993e449b9960"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.22-1/hammock-linux-amd64"
      sha256 "6ea8b07651e82a3e1634938d49105fb7bd8b690beed11819555bf3757b08f186"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
