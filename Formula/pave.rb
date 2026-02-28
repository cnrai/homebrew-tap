class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.15/pave-darwin-arm64"
      sha256 "72e5843c838ae860b30a29c84accc4ff1cee926add06263fff1705c6f0be796e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.15/pave-darwin-x64"
      sha256 "446e5291c3d7c0c46d89c2fed65de06eed6309ed7331bf5f88b6c3b7e8a8c104"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.15/pave-linux-x64"
    sha256 "a98d8cbed25c06592203f7f46277bc227ad79275733c9ba8a8502aeb19c2b68f"
  end

  def install
    # The downloaded file is the binary itself
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
