class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.23"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.23/pave-darwin-arm64"
      sha256 "5a4744b4282ae8d517f64a2a4f6c0a016972df8ee969bb9cd938c2b09b440c76"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.23/pave-darwin-x64"
      sha256 "aa608d5655dc2c8bb5b7ae51b5c9d9f513885ca95f97d0e3dd83ae2acf0902d6"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.23/pave-linux-x64"
    sha256 "3ac5aea5047ea671d9ac69238c33fb88a8391d87b1f957f724d4fb01ec076578"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
