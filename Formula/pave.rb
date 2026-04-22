class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.20"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.20/pave-darwin-arm64"
    sha256 "05ab989902b16e6a74ff2d394495de04df76a36495164457cf0aeb1062b63c60"
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.20/pave-linux-x64"
    sha256 "bc575a852f14d48d98d4811d354ec665527d3aafbc99ba8c2d7261bf582ea3c3"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
