class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.13"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.13/pave-darwin-arm64"
      sha256 "7aee7fc090717e535ab0dab009284b7dfca6ad9653575665b074698a5b988459"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.13/pave-darwin-x64"
      sha256 "bb7870d10c0752ab0254807c3bd557696035358bb89b4081d0c473c06d88a4d5"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.13/pave-linux-x64"
    sha256 "fef842d09028d25d98bf1e92b2202f2ec7a1adde6034c0ddabf06eef2f9d0b02"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
