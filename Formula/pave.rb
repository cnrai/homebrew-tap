class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.82"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.82/pave-darwin-arm64"
    sha256 "b0cb7fcee5b023c8fcf4929611006ac93fea2e8b8dcda7e3e22963bf4725ab45"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.82/pave-linux-arm64"
      sha256 "c2fc3ba046e0e6da5f5d781952a8f1f565bf3e1bb16b28574468a3b164e54738"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.82/pave-linux-x64"
      sha256 "ead07b40219cea308237f664dc6bad7daa22ba3781814c9585637cae5e70d64a"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
