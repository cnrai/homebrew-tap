class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.33"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.33/pave-darwin-arm64"
    sha256 "99b32128c9e3a2c5a5f56e97277afb39b608ef040ebaa396a4b8b71e2cd041ab"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.33/pave-linux-arm64"
      sha256 "29e1f4629fe226782ae7115b44a69b9f26eb44b34566f7428d427d2fb1e2c360"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.33/pave-linux-x64"
      sha256 "5fbda904347c23c99ed075bf6a5bac08e5dc6965d0b0e8f232ebc3df2cee3778"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
