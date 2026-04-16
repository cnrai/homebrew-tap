class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.9.5"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.5/pave-darwin-arm64"
      sha256 "4924c03fba0325729ca8565a91d0fac2428387f6f8ce55e4b053d1b9326041d7"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.9.5/pave-darwin-x64"
      sha256 "7e854ea4f49cd10fae5c75238c6715ef1592d49cf0195ab20152f6bdb08c62f9"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.9.5/pave-linux-x64"
    sha256 "380d33ab6c14ee01d799a4f89e992f00a536eef1863ebda9fbd5d1e49e3a40af"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
