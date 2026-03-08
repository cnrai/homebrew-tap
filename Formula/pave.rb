class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.33/pave-darwin-arm64"
      sha256 "ad45ef373957d368c63a5e9c38bfa60b0c8d4a22643435fe54f4302b7dba349f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.33/pave-darwin-x64"
      sha256 "d857e48530ba54af37e802a0f3da46d5875517991da56f744b2495c14bab3246"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.33/pave-linux-x64"
    sha256 "ed447d2a01b0c95b56738a855332348011d6baed0cd0d68aa90ab694893c3a23"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
