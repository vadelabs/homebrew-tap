class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.27-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.27-1/orbit-darwin-arm64"
      sha256 "5887ff01fc12d3ac726e2ca5b4a32fd50ab40b529861a0c9ee7beedbef7b4bba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.27-1/orbit-linux-arm64"
      sha256 "1ec4ae884153365b6b5497aeba63403fb3afb5112acc8124ead0067f9b635c87"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.27-1/orbit-linux-amd64"
      sha256 "b823b76cdef0e7137d604e7e6d9b0676709a60d8fb298441e695597c2dec2a6e"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
