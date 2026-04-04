class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.5.30"
  license "MIT"

  # SpiderMonkey provides the js command for secure sandbox execution.
  # The sandbox runs AI-generated scripts in an isolated SpiderMonkey
  # compartment with strict permission controls.
  depends_on "spidermonkey"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.30/pave-darwin-arm64"
      sha256 "b03b655be8c3ef1ef971e4ba9424def386cbcd7a20ed4843b9fb6ade0861046d"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.5.30/pave-darwin-x64"
      sha256 "34ced717a5c7098ecf25a3c3b2522e13411a574504e3ccdf5f8eada8b4cf6e5e"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.5.30/pave-linux-x64"
    sha256 "904623f1359e2b13eb56d2c7cfd1c9ccaa25c25c9c96d04c5525e1bacfeede06"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
