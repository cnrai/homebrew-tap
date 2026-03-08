class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-arm64"
      sha256 "e83f6ef43277e7045b40828c4dfcd4dd4d41fad9576faaa31175ac7cc83513f4"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-darwin-x64"
      sha256 "3e88b97f0c49ed05baa10bf0fb94ca1046e3c3b3dfb7f4b434f73910b806e763"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.32/pave-linux-x64"
    sha256 "cbbf92d71922c60c5a2a1182ba64f0142b1586f8d919da8b34ef33650b41af43"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
