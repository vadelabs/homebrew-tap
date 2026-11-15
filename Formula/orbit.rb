class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.15-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.15-1/orbit-darwin-arm64"
      sha256 "dda4ecd5c263d402b767fb02ff3524d03601e024d8ae69676f0ac55a8cc76446"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.15-1/orbit-linux-arm64"
      sha256 "683e3e1ec67e9cea63999b0c9a8312f951ae5065ce8b8826ce550a60b7ba097e"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.15-1/orbit-linux-amd64"
      sha256 "61ba25e3bf6cb9cb6b3095413ac5d61c7386c31184b3ae0c11317f110fc230c3"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
