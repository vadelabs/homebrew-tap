class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.07-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.07-1/hammock-darwin-arm64"
      sha256 "fcd61e53a4123530312c0369bf621f6b94e111e0958c06fef8fba9c4ab79ef9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.07-1/hammock-linux-arm64"
      sha256 "4c9d34a5756095458ab9bf23cf5bf0225be01d5b874d43afc2e6abca73e74d83"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.07-1/hammock-linux-amd64"
      sha256 "14094ac09160d671d0875e485f78f505cd5661fdb060bdd2a8be842caf2adf87"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
