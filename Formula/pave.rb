class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.58"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.58/pave-darwin-arm64"
    sha256 "27e457b8d0e8de5ea7ce1747283fe60a6592dd764a74aa0c726a19450bb89869"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.58/pave-linux-arm64"
      sha256 "f1e3769dec4b96eea13a3d01cccaf57823b2a33df9c698381f158dbc6be3c23d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.58/pave-linux-x64"
      sha256 "724f9a861c12c6f694ef32ac12652b5064543b3f57829e697432fedb0df69166"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
