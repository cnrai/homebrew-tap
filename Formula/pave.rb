class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.52"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.52/pave-darwin-arm64"
    sha256 "c135ca489861f9ac741562612a2468715ef2f8250ce5dada2e3c8ba933f58dd7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.52/pave-linux-arm64"
      sha256 "b92c33df0d044cee8bf6cbf584ebe6aea611e2fc8784a37f2d6d0feef9a18ccb"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.52/pave-linux-x64"
      sha256 "6d46e6e7d7b5c14119002b0c3ff5885ce382630b36c5c83999a4549cb4e3a10b"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
