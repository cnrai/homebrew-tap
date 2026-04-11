class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.8.3"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.3/pave-darwin-arm64"
      sha256 "98264fa4a18960691f88dbf558cdf56376c67cd13c355f314ef7370f433c1ea2"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.8.3/pave-darwin-x64"
      sha256 "7b82eb18223fac640c97eb777aa70aeb37e38c2cfb2dd1093c913f594c031b90"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.8.3/pave-linux-x64"
    sha256 "a1c49043c5fe9d5c0d29a46c1a66bbb2bd84d093914c74c41c0b6dbf4775eb12"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
