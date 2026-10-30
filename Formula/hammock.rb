class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.30-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.30-1/hammock-darwin-arm64"
      sha256 "a56fbd5031bbeb5364c14ea845f500834a2c2120aa4a6f94c48e51fc38c9e811"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.30-1/hammock-linux-arm64"
      sha256 "9fd6b15333f45e5073949134b32b37cbe9dc363d74d89ee6eee7d4fd2fccb86d"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.30-1/hammock-linux-amd64"
      sha256 "6e19c18ce1e208ab5b02231afa908e80ed7f3e2928edcf5c5bdf1b88876fd649"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
