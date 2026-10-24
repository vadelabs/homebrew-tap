class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.24-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.24-1/hammock-darwin-arm64"
      sha256 "d75a8cc67095d4250c62753fb3e5eab9d6303daf46e8a7f1eccc89d1a6b5df0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.24-1/hammock-linux-arm64"
      sha256 "3f4f286287de22ebbbebdb55e6aa318c9809cdf541f46a3f363eaa53d563d532"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.24-1/hammock-linux-amd64"
      sha256 "8efc26f38163bdce62f7c89e4c5eff50264496be15b88aa8d669770fb8920b9e"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
