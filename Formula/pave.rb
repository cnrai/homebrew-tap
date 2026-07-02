class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.27"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.27/pave-darwin-arm64"
    sha256 "1617764d24a0f4750b3a1fc8071359c37620aebfa81bf0ee34790e400b5eca03"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.27/pave-linux-arm64"
      sha256 "18dc44e12c8d7818d198cf127a6e903b6a6f962dc832d7b148bd80ebedab0a5a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.27/pave-linux-x64"
      sha256 "57074ffe7b04f62707c8daba491dda1e69c9525e51889d44dc652d8be44bfe9e"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
