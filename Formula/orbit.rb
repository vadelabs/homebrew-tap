class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.07.09-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.09-1/orbit-darwin-arm64"
      sha256 "620ca3bbce5af1c24b6fb640abf39a48522889ea1d56cd599d87766313f60e5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.09-1/orbit-linux-arm64"
      sha256 "e3b05dca40fdffe463eb999502eb8d6f9f6be09370c3e05528e98b01937ee87f"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.09-1/orbit-linux-amd64"
      sha256 "3bfebde75d57f542e5473e21f03b4fad322e1734e0106cd3a7eb8b948f607227"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
