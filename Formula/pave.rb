# typed: false
# frozen_string_literal: true

# Homebrew Formula for PAVE
# Personal AI Virtual Environment - Terminal-based AI agent system
#
# Install via:
#   brew tap cnrai/tap
#   brew install pave

class Pave < Formula
  desc "Personal AI Virtual Environment - Terminal-based AI agent system"
  homepage "https://github.com/cnrai/openpave"
  url "https://github.com/cnrai/openpave/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  head "https://github.com/cnrai/openpave.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"

  def install
    # Navigate to the pave package directory
    cd "src/packages/pave" do
      # Install npm dependencies for build (includes devDependencies for esbuild)
      system "npm", "install"
      
      # Build the distribution bundle
      system "npm", "run", "build:install"
      
      # The build creates a dist/ directory with the bundled application
      dist_path = buildpath/"src/packages/pave/dist"
      
      # Install the bundled files to libexec
      libexec.install Dir["#{dist_path}/*"]
      
      # Create the main executable wrapper
      (bin/"pave").write <<~EOS
        #!/usr/bin/env bash
        # PAVE - Personal AI Virtual Environment
        # https://github.com/cnrai/openpave
        
        export NODE_PATH="#{libexec}/node_modules:$NODE_PATH"
        exec "#{Formula["node"].opt_bin}/node" "#{libexec}/pave.js" "$@"
      EOS
    end
  end

  def caveats
    <<~EOS
      PAVE has been installed!

      Quick Start:
        pave                    # Start the terminal UI
        pave --help             # Show available options

      Configuration:
        Set OPENCODE_URL to your AI backend (default: http://localhost:4096)
        
        Example:
          export OPENCODE_URL=http://your-server:4096
          pave

      Skill Management:
        pave install gmail      # Install a skill from marketplace
        pave list               # List installed skills
        pave search <query>     # Search marketplace

      Debug Mode:
        DEBUG=1 pave

      For more information:
        https://github.com/cnrai/openpave
    EOS
  end

  test do
    # Test that the CLI responds to --help
    output = shell_output("#{bin}/pave --help 2>&1")
    assert_match(/pave|usage|options|help/i, output)
    
    # Test version output
    version_output = shell_output("#{bin}/pave --version 2>&1")
    assert_match(/\d+\.\d+/, version_output)
  end
end
