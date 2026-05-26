class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.5"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.5/pave-darwin-arm64"
    sha256 "fc06d8e7cadf2c5d0af2fb33d81802b07a36c46e7cb1144ba15318915b8f6d3c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.5/pave-linux-arm64"
      sha256 "2fd9582226aae222fadc6d57dc8cc5cb9d515b69d187bd5a2df7d859f6cda62d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.5/pave-linux-x64"
      sha256 "a240002089e67be95397976fac56ba1112a2060a8c351172fad53b2b137330d1"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
