class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.64"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.64/pave-darwin-arm64"
    sha256 "b448992cbbc388f811243513a484070d6c529669c2ca4976c6a49d4b81e9052c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.64/pave-linux-arm64"
      sha256 "5137eaac53d801f2fa1db77999b23aa2b724274a86b27ba924ce01d024e801b9"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.64/pave-linux-x64"
      sha256 "b7145a499571371f7e7ccc8fd2e3cbccbe3f7ce34458937d7b5c8c9d55bdd42a"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
