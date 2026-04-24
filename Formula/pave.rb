class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.21"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.21/pave-darwin-arm64"
    sha256 "31b82fc2ca11eb3f52972171c66010f6f90c3edc5df55d30a7aa9937c67f3c46"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.21/pave-linux-x64"
    sha256 "8745a1eb809dafd0faa343c5c9165fbb4ee137365904cb1f911ba121492c94a6"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
