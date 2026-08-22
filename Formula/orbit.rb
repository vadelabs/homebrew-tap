class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.08.22-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.22-1/orbit-darwin-arm64"
      sha256 "21dc0baac5a2f7fe5d3b52d815aa8a41299fb49c66e34f331d22ed0412ab8cc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.22-1/orbit-linux-arm64"
      sha256 "21753f7598255a9af3215e1f27202bb7df5d4b4f887586356c330a7abfad1852"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.08.22-1/orbit-linux-amd64"
      sha256 "2e2f4d62df19a477b62ba11ae791a6deb4d777a9dbd16a747fa8d73e3f82ef59"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
