class Hammock < Formula
  desc "Record, edit and export Hammock videos from the command line"
  homepage "https://hammock.video"
  version "2026.10.03-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.03-1/hammock-darwin-arm64"
      sha256 "ae3294b9ac7f170b3dd276437573e9ad55c24612c55513a5eece6db5f9d46cfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.03-1/hammock-linux-arm64"
      sha256 "3a3ca5c82ce26b8d413485685ab54919e50a8ca7f7960195227a433bfc041f54"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/hammock-cli-v2026.10.03-1/hammock-linux-amd64"
      sha256 "318f007c5113b3746791d3668fc2cf9169921e10decb86b3ca5f9b67e34749f8"
    end
  end

  def install
    bin.install Dir["hammock-*"].first => "hammock"
  end

  test do
    assert_match "hammock", shell_output("#{bin}/hammock version")
  end
end
