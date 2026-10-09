class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.114"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.114/pave-darwin-arm64.tar.gz"
    sha256 "620759839b28cb00e30c8d175b822445f95511331c3ad2a0b3ddbe3d4933e1a7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.114/pave-linux-arm64"
      sha256 "4ca8284affebfa2b55ae96eef56447ee4606e7db5354efd970c82804ec04ddd7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.114/pave-linux-x64"
      sha256 "092925be27ad4971feb45827a3ef6bbe69820c5ab91632fd1d846588301dc9a3"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
