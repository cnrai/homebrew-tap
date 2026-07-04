class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.29"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.29/pave-darwin-arm64"
    sha256 "33fe41fc4fa39ed21414f390cc6b22186b3a03329fdadb71d9622148d32b919e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.29/pave-linux-arm64"
      sha256 "bca7f41069f38516a4fe34fb8b3125461d6516ef7490239e58386bacac65651c"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.29/pave-linux-x64"
      sha256 "e77ac51805adcd140e784c34f20206b8bf5cedff50658dd83047344d4fe65881"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
