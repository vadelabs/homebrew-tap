class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.25-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.25-2/hammock-darwin-arm64"
      sha256 "20bad807e895ae6389451f8424713f5a59aace345157d8b2a7b265ed3e0cbfc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.25-2/hammock-linux-arm64"
      sha256 "4897e4e06c702b8a8b61f497316acfa93e62cf1ebe6eb909dc8df04ddad22cd7"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.25-2/hammock-linux-amd64"
      sha256 "ab50188db52dfeef610d2640edd087ab6d522c007a0e615b81343b33c7204a34"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
