class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.17"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.17/pave-darwin-arm64"
    sha256 "883c775b26a40aade614594ef2df96b94fa21925bdf22d7ce9bd22c02e9de0f8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.17/pave-linux-arm64"
      sha256 "c46a99533fcd13a04c67ecabae236adfab4c6568196747bc649899d0aa366738"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.17/pave-linux-x64"
      sha256 "4404120ef843d9e8751948c1aefb942bc2202f3b15a0b614cad9533a8325ccfa"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
