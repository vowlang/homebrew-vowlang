class Vow < Formula
  desc "Vow programming language — native compiler and vpm"
  homepage "https://vowlang.dev"
  version "0.1.0"
  license "MIT"

  # Prebuilt native release tarballs from install.vowlang.dev
  # Update checksums: ./installers/update-homebrew-sha256.sh
  on_macos do
    on_arm do
      url "https://install.vowlang.dev/vow-darwin-arm64.tar.gz"
      sha256 "f9a3e5b80687af50fafa8cb6cd8efb5012e3a10c1047fb665a39d8fe57f0a5c2"
    end
    on_intel do
      url "https://install.vowlang.dev/vow-darwin-amd64.tar.gz"
      sha256 "REPLACE_DARWIN_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://install.vowlang.dev/vow-linux-arm64.tar.gz"
      sha256 "REPLACE_LINUX_ARM64"
    end
    on_intel do
      url "https://install.vowlang.dev/vow-linux-amd64.tar.gz"
      sha256 "REPLACE_LINUX_AMD64"
    end
  end

  def install
    prefix.install "bin"
    prefix.install "share"
    (prefix/"VERSION").write version.to_s if (buildpath/"VERSION").exist?
  end

  def caveats
    <<~EOS
      Vow is installed to #{prefix}.
      Run: vow version
      Optional: vpm add vow-serve -g
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vow version")
  end
end
