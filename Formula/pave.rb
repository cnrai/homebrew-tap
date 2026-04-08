class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.7.2"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.2/pave-darwin-arm64"
      sha256 "4aa9be144ded7aab56c56aabb50d0ef6b690f537964d8975a890c14d16edcf66"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.2/pave-darwin-x64"
      sha256 "cc8118971a70b37580dee2d7c40e22d0cd46b16d907ed43afccb7f70e8bed899"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.7.2/pave-linux-x64"
    sha256 "dfc5934840f24633e67f908c26970c955cbb496c71aaf18bcd48600597b14402"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
