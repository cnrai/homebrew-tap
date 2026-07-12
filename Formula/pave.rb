class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.40"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.40/pave-darwin-arm64"
    sha256 "228e4d5950f28db854024f9fea3af58b81e9852ec1009223d206ef1ebdf6edbb"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.40/pave-linux-arm64"
      sha256 "abc9d1d3071750ad1b65f155f6fc0567e86416557d9431b6cec4d182c03cae20"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.40/pave-linux-x64"
      sha256 "ba9c7cce1d7f8ff4ab19508b3e2c8fbf63a905d3f4da0bd0e0f3c93c4b19654a"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
