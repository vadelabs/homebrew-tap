class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.11.20-1"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.20-1/hammock-darwin-arm64"
      sha256 "ddc1cd503176892f470dfb19faa5236dbd9d977a9553d3c9417449d9626c4ea7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.20-1/hammock-linux-arm64"
      sha256 "2a971d9c0f984ecd9b64b4b8742a10f7bea88f142b9de6130c26cb65cf90fe8a"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.11.20-1/hammock-linux-amd64"
      sha256 "50f0aea447d0ccf9dbf67f9d4030c213086277d0aa7acc3e7da45deca85d521b"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
