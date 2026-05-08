class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.9"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.9/pave-darwin-arm64"
    sha256 "d0d636edead8271566f4534279f31252c53d3da74236d44d87146473cbc0c1e8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.9/pave-linux-arm64"
      sha256 "bcd9548d1873018bd12947b577b4b5702e03c76376d48a636061fc3cdb552a22"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.9/pave-linux-x64"
      sha256 "e9daa89bf15555dca7a20f637b92160b161523c200b0aee2aa6cd16cc042c551"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
