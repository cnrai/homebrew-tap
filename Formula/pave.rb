class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.94"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.94/pave-darwin-arm64.tar.gz"
    sha256 "560b0af706180aa8c097a67e057db5e7b6d6d896f00ac5249f25a87a11adfd30"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.94/pave-linux-arm64"
      sha256 "722babdb2a9c356607a2d75e2f5e8371e784b8e28811765ea5927c8d76645bb9"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.94/pave-linux-x64"
      sha256 "061b84bacb64cd6716a9d0836d1efc837235f951958af544df2293465db0ba99"
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
