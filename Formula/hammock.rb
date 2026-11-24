class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.24-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.24-1/hammock-darwin-arm64"
      sha256 "b85239a74f162a774c0a7842ce77073d6176a6cf8a6c7bc8fee692920327c3d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.24-1/hammock-linux-arm64"
      sha256 "860b41d15b9674e94b7793cd28c0454dce0dff5c0b068f36d4d576acb83c31ab"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.24-1/hammock-linux-amd64"
      sha256 "063de642cff528ecbf8445d5cb96e42bef31bdf7020af2298405e187bde27a2f"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
