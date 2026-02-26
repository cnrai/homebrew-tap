# Homebrew Tap for PAVE

This is the official Homebrew tap for [PAVE](https://github.com/cnrai/openpave) (Personal AI Virtual Environment).

## Installation

```bash
# Add the tap
brew tap cnrai/tap

# Install PAVE
brew install pave
```

Or install directly:

```bash
brew install cnrai/tap/pave
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `pave`  | Personal AI Virtual Environment - Terminal-based AI agent system |

## Usage

After installation:

```bash
# Start PAVE (connects to default server at localhost:4096)
pave

# Start with custom server URL
OPENCODE_URL=http://your-server:4096 pave

# Show help
pave --help

# Debug mode
DEBUG=1 pave
```

## Updating

```bash
brew update
brew upgrade pave
```

## Troubleshooting

### Node.js Version
PAVE requires Node.js 16 or higher. The formula will install Node.js 18 as a dependency.

## License

MIT License - see the [main repository](https://github.com/cnrai/openpave) for details.
