class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.0"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.0/pave-darwin-arm64"
      sha256 "1be3a8bbef50b9482833110c7eef3ee914beb6e64b05291cd4b640f3993477d1"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.0/pave-darwin-x64"
      sha256 "9e86d5e458e15ea5d35a532918652e10d754b56b583274dc2762ec57c95dbad0"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.0/pave-linux-x64"
    sha256 "16c6911a90a50fe0b5e531c4edba8bce6997a5c6a86054021c4f3840ec813c4b"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
