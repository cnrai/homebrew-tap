class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.21/pave-darwin-arm64"
      sha256 "4c37dd8babc9db2a1ebcc931fd4235487aa81ae02cbfa950179a3150da663245"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.21/pave-darwin-x64"
      sha256 "b00565dd5ab7bec3fcd77c2a0b55ec1a23cfc65b89adc9a9a169927892bc8d1a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.21/pave-linux-x64"
    sha256 "6a29037cc6a920956b4beaea18cca7e4083faedfbc02a39768aa73ad10535a79"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
