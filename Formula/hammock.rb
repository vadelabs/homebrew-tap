class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.11-2"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.11-2/hammock-darwin-arm64"
      sha256 "993c241c1d6f552c65d60d5844b3a9a7d312824d3e5b0f8840303b5f3aed07ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.11-2/hammock-linux-arm64"
      sha256 "041704a45a323fd6397428d83bd429d00af05ed89ffc406ae3c6154557c53fa8"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.11-2/hammock-linux-amd64"
      sha256 "8415aab4d0d6d2181d98edfe874f147ff984f91e1b051ec0ecd4ca65abb6f346"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
