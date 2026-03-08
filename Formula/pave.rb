class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-arm64"
      sha256 "7183291130009f8c6bbe5e2db380867f449d05692db1be8319c3d684f89621d5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-x64"
      sha256 "83ffebe15304de6218a86151e50105045b369ae768d264fcd7367ea37ca1a21a"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-linux-x64"
    sha256 "29d3315c926120ade20de7ddfc54903c2dfc1ec737ca63660107a6b30b63319f"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
