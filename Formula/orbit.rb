class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.27-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.27-1/orbit-darwin-arm64"
      sha256 "3d0d304d61efcce5e9d06df4b805ae33fe34d7e4d01406e359b181814255d955"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.27-1/orbit-linux-arm64"
      sha256 "92e3e14ec0274a6e486340fd02a488658f79323522f37fbecbb76adb2cbf4610"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.27-1/orbit-linux-amd64"
      sha256 "b0ef77b7c755c7e4b892658a81fbfdd956fa5dc8cf49b3ca254b096417eeddd9"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
