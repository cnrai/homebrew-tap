class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.10.10"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.10.10/pave-darwin-arm64"
    sha256 "b4c5cf86d0fef1d002263125eeaae07e8e2ab537a791cab00f8900dc7c50e276"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.10/pave-linux-arm64"
      sha256 "8a619bf788e1135e5e2e97d3f8cc3000edc2a33197f7877523e9b812a0d2507f"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.10.10/pave-linux-x64"
      sha256 "4efa799d72c11ca8127c0833159c78a0bbfc77e959572a3d228e3fede3415c7b"
    end
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
