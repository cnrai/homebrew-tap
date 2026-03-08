class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-arm64"
      sha256 "2c71d6fb2de83f20020bffd43675a6649ec0c36a936b890df406eeec029beec4"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-x64"
      sha256 "681738bf4d04b31ae6116b633abf376320a22e765ec4f4c69c61f4b99b1659d0"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-linux-x64"
    sha256 "4c49b8147af7ca2742f6402aa1354d7e243f3fb8444ee2bcd8c9c6a75e2b9fec"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
