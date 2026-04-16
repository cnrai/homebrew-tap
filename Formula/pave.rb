class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.10"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.10/pave-darwin-arm64"
      sha256 "18329cf9218c685e70e0dd07a9e2867aed1ee75e7a99fb426db155a9797dbba6"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.10/pave-darwin-x64"
      sha256 "636feb365e54e4e38db5707a75e602bf29a29e1cec4b88fece2943d710761407"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.10/pave-linux-x64"
    sha256 "895fe4debf8a26315e04d0b7dfe11c9b0cb0b5665cd13b3c4ae46ca46c7e8b6c"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
