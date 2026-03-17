class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.62/pave-darwin-arm64"
      sha256 "6b7b60aa5efbed9c7eba7a6c6862b05298a75fc2c7f1dd9c100b7f2bc7b8fcdb"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.62/pave-darwin-x64"
      sha256 "8ecbf5e5ae99a1177df0743ed83e08576c972c2f27b537697903d67f32854070"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.62/pave-linux-x64"
    sha256 "e37e3cafac72eceb0ee33b5b9cd6eb6a76d13a02964bd50b94c273c12f4b811e"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
