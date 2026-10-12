class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.12-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-1/hammock-darwin-arm64"
      sha256 "e678978b66d4ff7947ca65329768ce907076f8068dff64aaa67424ea20888820"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-1/hammock-linux-arm64"
      sha256 "b80aa6aa50f608d161a88ac283ebe9ca38e10fd580bd6a25d3e9c2e2b49db11c"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.12-1/hammock-linux-amd64"
      sha256 "9cc6bd95479415a4c19d154e353a4d3b899a0ea88b10cca7139bab7f08f6e766"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
