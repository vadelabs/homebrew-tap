class Orbit < Formula
  desc "Control and build Orbit apps from the command line"
  homepage "https://orbitapps.io"
  version "2026.10.19-1"

  # macOS: Apple Silicon only (Intel Macs are not built).
  on_macos do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-1/orbit-darwin-arm64"
      sha256 "d9da1a2582aa31bd9fbd0d828302857eef9a355eb63c4458fcaa6644521ef6d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-1/orbit-linux-arm64"
      sha256 "374fb0838e7504db30c42d6fcca849d2a9958b7c0c67da4999cb71055a68b02b"
    end
    on_intel do
      url "https://github.com/vadelabs/homebrew-tap/releases/download/orbit-cli-v2026.10.19-1/orbit-linux-amd64"
      sha256 "458f81d3e25e5cd147c45ee1c0d55f80933c7c6ba2a5340eb77cb15ac927709a"
    end
  end

  def install
    bin.install Dir["orbit-*"].first => "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit version")
  end
end
