class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.45"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.45/pave-darwin-arm64"
    sha256 "8a54036472f973c756f21898abbb3ec8f7f969d4d01b7ec552ac9fedf5d81513"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.45/pave-linux-arm64"
      sha256 "aea75234295675f8c479667240ea40ae338c34cef89f3f7f937814200904996d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.45/pave-linux-x64"
      sha256 "4a9a84aeae200dc9e01d7d0125d9faed669155c492df27fcabfee15b4c6b6745"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
