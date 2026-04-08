class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.7.3"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.3/pave-darwin-arm64"
      sha256 "e6ddcb18f9f98355856de3fd11e04621ec37e134de6fa785f31aa9ef60141254"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.7.3/pave-darwin-x64"
      sha256 "47ac63e2b9707ab4e40505a684dc3f80011ee7858ea66d4067e1e59ccf794ed1"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.7.3/pave-linux-x64"
    sha256 "a433c728d8d92462d0bce9130a300fd4b9d4fb7ec727531c98851c6b10fa8988"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
