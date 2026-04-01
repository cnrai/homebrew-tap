class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.22"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.22/pave-darwin-arm64"
      sha256 "2391e2155b012bbe1f96088abf10f3fbd6386756eff6c403c6e0c5c096abaaa8"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.22/pave-darwin-x64"
      sha256 "90049d42b4eefa4e34b08d3ceb799d97752b1fe11189af85f54917074e831341"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.22/pave-linux-x64"
    sha256 "45ec445a0fb506f3efffd4a7b686aabc1e5b9f5ab467b7be98e3ebabd5297cbe"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
