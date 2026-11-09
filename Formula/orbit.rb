class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.11.09-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.09-1/orbit-darwin-arm64"
      sha256 "6233d9efc259627396d521a3097539217f38727c0f862f5ddfcd77784ca2df4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.09-1/orbit-linux-arm64"
      sha256 "8004148ed1961b94c4947499c5e0f22efb3d133712f4cda5ab7ceb378dd512ab"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.11.09-1/orbit-linux-amd64"
      sha256 "a8ff746e500133421af75233ef7fe2b87f55909151cc08a8c76b92e91c4b8b85"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
