class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.63"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.63/pave-darwin-arm64"
    sha256 "e7fdf779cbd57f60bb7e3ed19712334f8b0712e9aa8e6c3cfc38a358f7aa56ba"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.63/pave-linux-arm64"
      sha256 "d40b6ee200f27e0e21de34b407f1215e09100989c685934ac0068cc9df7ba674"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.63/pave-linux-x64"
      sha256 "c5b4bd1ba9d014f03632293f703a6256b80ad66cc036410eaf9a958bd17883c2"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
