class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.16"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.16/pave-darwin-arm64"
    sha256 "59f3d0fd3b7ef82c2333a1268c049af8d8e2efcdc70544716446d4888969c294"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.16/pave-linux-arm64"
      sha256 "6c8f08e795b655d52f8b11a9975b769d1572af93b6d27ac93225f970c465731b"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.16/pave-linux-x64"
      sha256 "de44339d75ff9232842ac99db997b5f8371bee446df5a77840bfd858da1dd9cb"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
