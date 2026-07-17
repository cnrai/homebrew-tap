class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.48"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.48/pave-darwin-arm64"
    sha256 "29b09bb63e63a3cd945b6a6f61eb5774eea908f5cecbe6bfd32c3ea088accb61"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.48/pave-linux-arm64"
      sha256 "ac76cb44aed514f96ad1498ab8f0bed8d6fd907ce0ae5ad057ca4f59d2d16cf6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.48/pave-linux-x64"
      sha256 "7fe63d82d3a923041a2bba2ad437f36c438d3eb115c25c6dcb204cba3fa3dda3"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
