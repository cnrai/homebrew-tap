class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.28"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.28/pave-darwin-arm64"
    sha256 "4a5a51555508c03e0e61c365543ba3c688ca8d4134ae1ae422d0fec81fe17bf5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.28/pave-linux-arm64"
      sha256 "591d367f181535157fb5c99705475d7ee6edb88af9c81b7064b305623cd3d04d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.28/pave-linux-x64"
      sha256 "c568ee9711bf396111bce9f79344ccc017f469e20f0773da09add9c3e4aa123e"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
