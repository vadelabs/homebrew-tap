class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.26-13"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-13/hammock-darwin-arm64"
      sha256 "97d6f29a2b2614a4267bce7a1cd28bec1f7c2230e73745db251d660a2c53a417"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-13/hammock-linux-arm64"
      sha256 "107274c337e133b54781eaaeb0e3700dba6f53d3c1cb8ddcd5f3a279b8f67b3e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.26-13/hammock-linux-amd64"
      sha256 "9e5919e1ea41b6ab19252074e38067df972e798432b6f38445e8e1e712283d11"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
