class Pave < Formula
  desc "Personal AI Virtual Environment - AI agent framework"
  homepage "https://github.com/cnrai/openpave"
  version "0.3.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.51/pave-darwin-arm64"
      sha256 "ecba5fa0fc56f093d49a64172a68ab3264fdb7466f56dedeaf52932a9011b0ae"
    else
      url "https://github.com/cnrai/pave-dist/releases/download/v0.3.51/pave-darwin-x64"
      sha256 "ef015b399d9e4bebfe355b14810001509fecc0795724b3a4224eb6b41af2688c"
    end
  end

  on_linux do
    url "https://github.com/cnrai/pave-dist/releases/download/v0.3.51/pave-linux-x64"
    sha256 "2ac41889c65c3a0aa7cab7a74e1398856cb1c9f7abfaceb00240580fafe78860"
  end

  def install
    bin.install Dir["*"].first => "pave"
  end

  test do
    assert_match "PAVE", shell_output("#{bin}/pave --version")
  end
end
