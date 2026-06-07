class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.11"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.11/pave-darwin-arm64"
    sha256 "055e2f08dcc7ac274ba9fb91d7153b4e282dbb59fdcea086d246c861c516d261"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.11/pave-linux-arm64"
      sha256 "419c39f3e43ddee235c25cc02a64d998b817a05ed5061fce6109ef4fe4aae4f4"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.11/pave-linux-x64"
      sha256 "18faebd769b7c3e6c308cb42846ad8d5bef2e6e0edb272cea3bbf48a14ad2dbe"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
