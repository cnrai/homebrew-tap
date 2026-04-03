class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.27"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.27/pave-darwin-arm64"
      sha256 "2ccbc464727aef582aaf942ce10cfeee504f56d6803cad18c6950dc4b33df3e1"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.27/pave-darwin-x64"
      sha256 "50b7609b31894c83079201ffffee268c73a87bd9d6dfdb656a84fe9fa19dd369"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.27/pave-linux-x64"
    sha256 "2672efec58178c75c323f7731e670fe95f42976f15e962c2d5ae1d382af20017"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
