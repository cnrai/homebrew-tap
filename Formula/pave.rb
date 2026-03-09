class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.34/pave-darwin-arm64"
      sha256 "d866ac79c3f60d74de9c02645a5ce998882fdd9b6eafdfaec093fc25d389f2b6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.34/pave-darwin-x64"
      sha256 "f721224f0207bd18f14e428ba836c4bbcc57fad2dc26961dadbd3f4e866cd5f2"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.34/pave-linux-x64"
    sha256 "eebe95ded9a9dd09f1cadd21cb4fbd51f5cd19280b2bda62aa26df8af6b36928"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
