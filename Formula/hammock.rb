class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.12-4"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-4/hammock-darwin-arm64"
      sha256 "36438e9953b5a2a9a34fecc82f7312a7058d9299727968287c33b740bab5c2cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-4/hammock-linux-arm64"
      sha256 "d004be309efa5b60349a30471ec594ad19798ff6220cbf6b2fc73b5eaf47d8c1"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-4/hammock-linux-amd64"
      sha256 "fbc0c194242de28bea83a5b918a9fb4bbfb8bc9d1ddbb5273f63547e76329b23"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
