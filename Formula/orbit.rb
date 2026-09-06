class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.06-6"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-6/orbit-darwin-arm64"
      sha256 "8cf870de826c2dfef46ee88fdf0e88d1c872cef673a00178f7710f02605678d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-6/orbit-linux-arm64"
      sha256 "86fc369ff72d718b97149cf29a8a8631f4496807844d6377f0232c96323f4c42"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-6/orbit-linux-amd64"
      sha256 "cb1c9104de165f160a1546154f0c768b2e5518e50bd700e7a23a827679d26e25"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
