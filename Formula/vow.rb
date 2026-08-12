class Vow < Formula
  desc "Vow programming language — native compiler and vpm"
  homepage "https://vowlang.dev"
  version "1.0.0"
  license "MIT"

  # Prebuilt native release tarballs from install.vowlang.dev
  # Update checksums: ./installers/update-homebrew-sha256.sh
  on_macos do
    on_arm do
      url "https://install.vowlang.dev/vow-darwin-arm64.tar.gz"
      sha256 "c96b46ad8a99d8049c4145a07cd804ea78ec3a8ba736be0369c4db8571f8b060"
    end
    on_intel do
      url "https://install.vowlang.dev/vow-darwin-amd64.tar.gz"
      sha256 "REPLACE_DARWIN_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://install.vowlang.dev/vow-linux-arm64.tar.gz"
      sha256 "59b4f8bd5b1b95b36288efacef6c42569af41cf774af7aca556706927c79ee3e"
    end
    on_intel do
      url "https://install.vowlang.dev/vow-linux-amd64.tar.gz"
      sha256 "499fe61bab705ce289a0c890cc033644c93eac807f9c1ea8b1545a524259f5c4"
    end
  end

  depends_on "libpq"

  def install
    prefix.install "bin"
    prefix.install "share"
    (prefix/"VERSION").write version.to_s if (buildpath/"VERSION").exist?
  end

  def post_install
    libpq = Formula["libpq"].opt_lib
    (share/"vow/release/runtime_link.flags").write("-L#{libpq}\n-lpq\n")
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
