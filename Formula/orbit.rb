class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.06-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-2/orbit-darwin-arm64"
      sha256 "9629edd65659fb5eef287858ffd9a1d96acaf43f145b9be21a5cfa3a3b22f098"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-2/orbit-linux-arm64"
      sha256 "3a442d080ca453ffb7bcb8b783e4b43d7d90894e4b07202bc9a947f54e4bd640"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-2/orbit-linux-amd64"
      sha256 "72c268f1cd4bb1e9d216c7644c587ad4bc002dc38b391ec70990fe11b6755e85"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
