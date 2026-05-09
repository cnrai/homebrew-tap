class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.12"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.12/pave-darwin-arm64"
    sha256 "c3cc2f98b9cc522909fd10d4fe4fe7bf894da57d091ee1ec14c8e01fc2c3c9c4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.12/pave-linux-arm64"
      sha256 "4bd3310e5447e47f99c68d0c05b061288acbf1992c7ad9cd3373ac19302134f5"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.12/pave-linux-x64"
      sha256 "84118abb685947905b5069fdc074232e15fb665443266206b46771ebc7c97379"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
