class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.18-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.18-1/hammock-darwin-arm64"
      sha256 "6af309047910a8545a2923915752f6d791cb14b52f6c4d0666c574b7faae4379"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.18-1/hammock-linux-arm64"
      sha256 "5eaf25a628c2f8c6515784f8ecf7a9659f55b697e6a053ea7f8be82223a3a9d3"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.18-1/hammock-linux-amd64"
      sha256 "faeaf740f8b2e2be2f0bb4007301dd823a92b694021cb267d6e8193c61803b62"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
