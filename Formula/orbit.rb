class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.18-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.18-2/orbit-darwin-arm64"
      sha256 "e2f46f2a5167408748136a15435e3aeb9ce5f24ce6ef59f68c04f162215abd99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.18-2/orbit-linux-arm64"
      sha256 "4b2645dfa7705c122bf636ded80c0f90a5320141eaadd96fd912b339346f9a39"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.18-2/orbit-linux-amd64"
      sha256 "cf8490e87711c24ea14a109123a77908c1dd7f247f5315014dd2192527384f6d"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
