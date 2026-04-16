class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.6"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.6/pave-darwin-arm64"
      sha256 "56de12ba9fe8d17552f3f2bf1de1d5dabc0a6af96436e37132e9311c13322e7f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.6/pave-darwin-x64"
      sha256 "2a847e120063a554029391aadc5268699dc10421afabd886f01b535c2932b410"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.6/pave-linux-x64"
    sha256 "c8724b499bf59c6ae8e479099fce9f8cc97f64aa4dcc44cac556ce049db74030"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
