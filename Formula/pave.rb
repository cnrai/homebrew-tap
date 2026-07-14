class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.44"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.44/pave-darwin-arm64"
    sha256 "ebbc6c4b9704f25daa98750e45cccbc7ac2164db6552d7ae9a17f50350a49d8f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.44/pave-linux-arm64"
      sha256 "735352614eed1246666f7fbba8665b72239cdbdf049d5d206eb0835807d9ced4"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.44/pave-linux-x64"
      sha256 "c7115fd3bf14d464735ff1f33deba0af8e58cbaf9d7c5a16e131c6a5e621713e"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
