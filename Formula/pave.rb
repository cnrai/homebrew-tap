class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.28/pave-darwin-arm64"
      sha256 "b6197badfb259fce615a92275f7685d448fd884d3acca75bf4c2c277c0f71547"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.28/pave-darwin-x64"
      sha256 "4f99ad701bd78f66ded3ee3bcba5f2bfd4fb43a29abc40cdb0fb1bc369491902"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.28/pave-linux-x64"
    sha256 "d4c34a1a8a8c6680e7a067dac09eaf9b8bba9873966e3637ae807316ecb2c909"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
