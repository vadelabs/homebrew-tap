class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.07.06-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.06-1/orbit-darwin-arm64"
      sha256 "c97cb2a4034a568a49dec238f7cb89109098ff1171f11a3b890f055fbef5dff0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.06-1/orbit-linux-arm64"
      sha256 "8f611bc2bf48afb4c846140926f73b3947f07511af6886d56d45004385877498"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/cli-v2026.07.06-1/orbit-linux-amd64"
      sha256 "8c2c1ba348091072513cc76c48cacb24b9f38557e2437567c303a67f15fdcf48"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
