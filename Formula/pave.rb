class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.126"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.126/pave-darwin-arm64.tar.gz"
    sha256 "7e387765d3f9ac73051dd9b5bdf4eef09312a3aeb41f0ca8c3cdb1336ff8b060"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.126/pave-linux-arm64"
      sha256 "095954c685c5eda1fd27ec110a8866159e67995b97a058dff0967314a2263adc"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.126/pave-linux-x64"
      sha256 "5417c23dad1dd38b94cc31dbc12ec0f2a76e0e87a06fdcb0dac9f86d17b1aac4"
    end
  end

  def install
    if OS.mac?
      bin.install "pave-darwin-arm64" => "pave"
      libexec.install "portable-git"
    else
      bin.install Dir["pave-linux-*"].first => "pave"
    end
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
