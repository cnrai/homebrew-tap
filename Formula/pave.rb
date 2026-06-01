class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.7"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.7/pave-darwin-arm64"
    sha256 "c564672712eb91a4b6b247b2f64b7fd0f208d59d31719113863659da08f61c86"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.7/pave-linux-arm64"
      sha256 "3798735e8fe45976df1f977afab94cbfed8cd5d6c409a73f6a0e912660f8aef7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.7/pave-linux-x64"
      sha256 "4a7e2142e5f34f8326e51fb896f354a4cd1ef8bb0f94c679a42e9ed9d836fd73"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
