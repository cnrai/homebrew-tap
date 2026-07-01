class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.24"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.24/pave-darwin-arm64"
    sha256 "b7f675157baa874d5aa95791ec622b643e4e391790f00788d1dcd8b73d3bb47c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.24/pave-linux-arm64"
      sha256 "aebe436208e18f5d8a8728b3a72aee2dc6284e50670280c19d0d7ec5e02b2a14"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.24/pave-linux-x64"
      sha256 "331fbed8aebed87ed52b0e81334bc5bf5c2577222649da759b3e99e932734c9e"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
