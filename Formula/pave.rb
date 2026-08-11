class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.11.76"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.11.76/pave-darwin-arm64"
    sha256 "c34dc6755b5c1610e8861f862470d5e1105246b3e21a26a77d02618202fc65e2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.76/pave-linux-arm64"
      sha256 "df2b8d19e2396153c49e0381d6f06b27a908a06d082d4ea2022c0ebbec47bb0e"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.11.76/pave-linux-x64"
      sha256 "bba0b31c77f5bbeb7a4a9f5be8ccb8de56289bf326a4b815372a0f6877dc8db4"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
