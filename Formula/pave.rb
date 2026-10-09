class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.112"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.112/pave-darwin-arm64.tar.gz"
    sha256 "f20d8f326d8b48736f4cd5ec2fb2ef1ed7afbc1d9f59da5b901d1326e6b5081a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.112/pave-linux-arm64"
      sha256 "2608fa18de1c856c1f96cb77d1587802c43388d8568a954860d0e10c609b210a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.112/pave-linux-x64"
      sha256 "2b11aae6c690cc479eb489555ac63f83ffcdd7d679a604238cbffbb547bc313d"
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
