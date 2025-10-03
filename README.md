# Fathom Platform Utils

This repository contains utilities and tooling for the Fathom platform development environment.

## Overview

The platform-utils provides scripts and tools to help manage and initialize the Fathom development environment, including automated repository cloning and environment setup.

## Structure

```
platform-utils/
├── bin/
│   ├── activate.sh         # Script to add bin directory to PATH
│   ├── common/
│   │   └── config.sh       # Shared configuration loader
│   └── init/
│       └── pull_repos.sh   # Script to clone required repositories
├── config/
│   └── default.conf        # Default configuration settings
└── README.md
```

## Usage

### 1. Activate Platform Utils

First, activate the platform utilities to add the `bin` directory to your PATH:

```bash
source bin/activate.sh
```

This will:
- Add the `bin` directory to your PATH
- Make all scripts in `bin` executable
- Display available commands

### 2. Initialize Platform Repositories

Run the pull_repos script to clone the required Fathom repositories:

```bash
init/pull_repos.sh
```

This will:
- Clone repositories defined in configuration to the configured directory
- Pull latest changes if repositories already exist
- Use settings from config/default.conf or config/user.conf

## Configuration

The platform utilities use a configuration file system:

- `config/default.conf` - Default settings
- `config/user.conf` - Optional user overrides (create manually)

### Configuration Options

- `FATHOM_REPOS_DIR` - Directory where repositories are cloned (default: "platform-repos")
- `FATHOM_GITHUB_ORG` - GitHub organization (default: "fathom-io")  
- `FATHOM_REPOSITORIES` - Space-separated list of repositories to clone

### Customizing Configuration

1. Copy `config/default.conf` to `config/user.conf`
2. Edit `config/user.conf` with your preferred settings
3. Re-run `source bin/activate.sh` to apply changes

## Scripts

### `activate.sh`
- Loads configuration from config files
- Adds the `bin` directory to your PATH
- Makes all scripts executable
- Shows current configuration and available commands

### `init/pull_repos.sh`
- Clones repositories defined in configuration
- Updates existing repositories with latest changes
- Uses configurable directory and repository list

## Requirements

- Git
- Bash shell
- Access to configured GitHub repositories

## Development

To add new utilities:
1. Create executable scripts in the `bin` directory or subdirectories
2. Use the configuration system by sourcing `common/config.sh`
3. Follow the existing naming conventions (.sh extension)
4. Keep output minimal and clear
5. Test scripts before committing

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is part of the Fathom platform tooling.