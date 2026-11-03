class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.119"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.119/pave-darwin-arm64.tar.gz"
    sha256 "f722e36331c147f002c6228df9b85b60c506c00849b20fe3c24c95b017beb429"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.119/pave-linux-arm64"
      sha256 "f7506acbaf9539c2439b68b1681ebc6c662785fb56534af73fb4ba6a7d7c7d07"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.119/pave-linux-x64"
      sha256 "dba4d741b242a42538e568009c772e2ef96ed640da36cf7f9c7a47cfacb07f64"
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
