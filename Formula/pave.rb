class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.34"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.34/pave-darwin-arm64"
      sha256 "c0d421cd2bc44ce42e2a0379d9a6f17409fa918d006357607d0678f260b7ae88"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.34/pave-darwin-x64"
      sha256 "fdc07277c4bf9e42efe39ac5e91461df90b03b7d38012ad1df3ef49b3fcbe785"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.34/pave-linux-x64"
    sha256 "58449e5154ae58ec0a693f0b094a2efceeb2407bfa552e6ad3bf230f586c381d"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
