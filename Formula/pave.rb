class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.69"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.69/pave-darwin-arm64"
    sha256 "83ced80a1c25272e11f87b564d165343f24b5f8afdf2e4d1f305df2293f7c14e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.69/pave-linux-arm64"
      sha256 "e50877300f3ac4cdaf5aff92fa9e36a73dd2e2205520a6420d379a0c3b54ddea"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.69/pave-linux-x64"
      sha256 "5f01b8dc6e181b775797040f4799811e88dd22e7b0c6a804d41a0c0b7b041e9b"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
