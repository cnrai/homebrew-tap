class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.17"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.17/pave-darwin-arm64"
      sha256 "97aeed4016a49dd1735a06dd8d2dd760dcb9a02de85ac2577ca84ea57d9d4ea5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.17/pave-darwin-x64"
      sha256 "e332be917fee32a5edca050c3d9fdb2b813c8fd72facd91635337dd688abbdae"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.17/pave-linux-x64"
    sha256 "4234e1b95a59170eb2cdadcb51839d94ec935f9411b2c02b3a37f4e738fc36c1"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
