class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.09.20-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.20-1/orbit-darwin-arm64"
      sha256 "8527c95418f09eae0bc31a2655a6262489e9aa73fb15f1bfdfc38e0ff48d650f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.20-1/orbit-linux-arm64"
      sha256 "2b4c93f5c2db67db7da312040b1142447c65a536f715f6b0bf503f8c13ae6f13"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.09.20-1/orbit-linux-amd64"
      sha256 "0f09203a6ef6e5a9aa85a0d6be24b0355ce7632a5ed84ed16e99df0e57823fd3"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
