class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.89"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.89/pave-darwin-arm64.tar.gz"
    sha256 "d2dce5856de121a9cdbe5e5298824b6508990f66e1662d85eb98de1f71268cf6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.89/pave-linux-arm64"
      sha256 "22e2c19066a58f1814a8ac7e4e7796d75fa6eb472b2d0dff378cf98837794681"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.89/pave-linux-x64"
      sha256 "be4aed1bf4db42822fe87d723a50234ef1d5b9037c785d48be423ccaa78bb5a9"
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
