class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.24-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.24-1/orbit-darwin-arm64"
      sha256 "972e15eb425a83a1aa433a9abd52fd577ed25449add2d9aa18f354cf6e2b3bdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.24-1/orbit-linux-arm64"
      sha256 "007997357f6992e73120a726a859d0ceb9d95d0687616beca5fb5aeff09a3365"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.24-1/orbit-linux-amd64"
      sha256 "1c593839b7d2b58f55fb50d76c5b347519f0f6cf418e5e40eff359c6578473fc"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
