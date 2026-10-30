class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.30-2"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.30-2/orbit-darwin-arm64"
      sha256 "199e0cffec7acded5ff82aabfa774bbebceb2b87847a725bc460edbc110a41a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.30-2/orbit-linux-arm64"
      sha256 "899a8276890d216200141777e140c2950d12f5f25c629b93a8db629581ffa5c9"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.30-2/orbit-linux-amd64"
      sha256 "dc17fc293d78d822cd4f42e0f66b66f24e4f51a937930b04832f393e842f021d"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
