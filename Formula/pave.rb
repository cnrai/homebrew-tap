class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.8"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.8/pave-darwin-arm64"
      sha256 "fd6593df48c91fbdb7360200f921f9431474384f073268a092bd608de1f6946a"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.8/pave-darwin-x64"
      sha256 "af3e41cb921843201c37618e5fe4f21a5e50821243643482d357dc36831c2755"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.8/pave-linux-x64"
    sha256 "a49057aa1756541c2eec98e33bb35d3692f94856cec9930e0b28c3578a2187de"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
