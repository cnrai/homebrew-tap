class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.24"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.24/pave-darwin-arm64"
      sha256 "1626509217a929786d5886348e319131971f01739ebdc56f87f51ca1f2c4b382"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.24/pave-darwin-x64"
      sha256 "6ecaaf0902c927e08f60c02742ea0d7e4dfa04cdbad45b2242363b1fd7d606c3"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.24/pave-linux-x64"
    sha256 "b4f777c4f2a8e251806be289663cd0c908df316204af79266566d5e094a94012"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
