class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.06-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-1/orbit-darwin-arm64"
      sha256 "cfca397049c87c55c3b63e71cc9d4fe72a9d13f79e5c7a4d3fb57eb44f6336a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-1/orbit-linux-arm64"
      sha256 "461de90f47401c31496a80ae7cbbe822714f1081ebfa767e74945bc064d137e8"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.06-1/orbit-linux-amd64"
      sha256 "c66d55a7cea91c0755d4618d6159152674cf671421a94001b85290291fd09603"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
