class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.09-5"

  # Linux only. On a Mac the cask ships the CLI inside Hammock.app
  # (`brew install --cask vadelabs/tap/hammock`); a formula on the Mac too
  # would claim the same bin/hammock link. The macOS URL stays so the formula
  # still loads there; `depends_on :linux` refuses the install with a reason.
  depends_on :linux

  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-5/hammock-darwin-arm64"
      sha256 "d448027c58af877a12f68f4c20453d4965799db893e3ddd9aff038cf829817ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-5/hammock-linux-arm64"
      sha256 "594b95c012936a81c62bfaded248c56c498d27d3a9f93a1e45ace330fcd804ae"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.09-5/hammock-linux-amd64"
      sha256 "d45ee5eae8161470f3d1e5a1187e541fe82e1c6728f9b87de2d05f5ae110f76c"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
