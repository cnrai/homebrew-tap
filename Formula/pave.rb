class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.81"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.81/pave-darwin-arm64"
    sha256 "1935727878be6bcd9484baa27022e1be2f1e85b6570db1cf28165bc7575b07c3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.81/pave-linux-arm64"
      sha256 "d2903793ead75afb45e0dbcc95fa970bc51229717968b71d8c022906b76d0bca"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.81/pave-linux-x64"
      sha256 "ffc56f6119f070be44701e678856b3b271063d92655fc8fa0059d73ef1192dbe"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
