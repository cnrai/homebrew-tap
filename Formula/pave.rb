class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.31/pave-darwin-arm64"
      sha256 "cf7d49fd17777720e707affef6d0527db60a4d415d1ffdcf3479237340749993"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.31/pave-darwin-x64"
      sha256 "c3f7bf5601ab2625932f6764245ae8bb9767fbfd9a6b58bf3923f2617046101a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.31/pave-linux-x64"
    sha256 "4c6483dfdb3b7748634954dcddd7fc56162305cfa0473ad3c9769df9bc01a669"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
