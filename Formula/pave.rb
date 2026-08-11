class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.75"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.75/pave-darwin-arm64"
    sha256 "eb66e902219f424292114e55a4d0a992ac0244d73a7f62c32099e40c8f154211"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.75/pave-linux-arm64"
      sha256 "a881fb079971d70d58952f4552d74a2e3ede8482718014590017275b9c1b2d9f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.75/pave-linux-x64"
      sha256 "56d082c123021598d13b773d41a1916e0fe752a5fae76c572da308bd901cf89f"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
