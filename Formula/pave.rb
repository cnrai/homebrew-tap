class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.26"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.26/pave-darwin-arm64"
      sha256 "ec79b17192b53295b667a455877d52e2f304b99519634306cf6758659a23c5b7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.26/pave-darwin-x64"
      sha256 "d35f84bf512a9774359745ee029cd712a55774e1cba8f5e4964a0396218a2df8"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.26/pave-linux-x64"
    sha256 "2912213bb8f3a5b58a3526a08a67e713e5873a3c2954a674a15ce86d18607445"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
