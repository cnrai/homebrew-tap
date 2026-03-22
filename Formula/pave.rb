class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "1.12.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v1.12.8/pave-darwin-arm64"
      sha256 "2951bb85acbab491fba03892f59a2a4dc608e603b6f71fa2fedd789a61e6ad2e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v1.12.8/pave-darwin-x64"
      sha256 "4b86547eac8d82e94eb061ed5c0207a4daa34f19344d2f97198b7f9562a2084d"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v1.12.8/pave-linux-x64"
    sha256 "f00e1d99addce607e7ef593aa9d4fb97c7702281f08a64b5ab74b648cc4e7156"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
