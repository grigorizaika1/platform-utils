# Fathom Platform Utils

This repository contains utilities and tooling for the Fathom platform development environment.

## Overview

The platform-utils provides scripts and tools to help manage and initialize the Fathom development environment, including automated repository cloning and environment setup.

## Structure

```
platform-utils/
├── bin/
│   ├── activate    # Script to add bin directory to PATH
│   └── init        # Script to clone required repositories
└── README.md
```

## Usage

### 1. Activate Platform Utils

First, activate the platform utilities to add the `bin` directory to your PATH:

```bash
source bin/activate
```

This will:
- Add the `bin` directory to your PATH
- Make all scripts in `bin` executable
- Display available commands

### 2. Initialize Platform Repositories

Run the init script to clone the required Fathom repositories:

```bash
init
```

This will:
- Clone `fathom-io/data-ingestion` to `../platform-repos/data-ingestion`
- Clone `fathom-io/data-processing` to `../platform-repos/data-processing`
- Pull latest changes if repositories already exist

## Scripts

### `activate`
- Adds the `bin` directory to your PATH
- Makes all scripts in `bin` executable
- Shows available commands

### `init`
- Clones required Fathom repositories to the `platform-repos` directory
- Updates existing repositories with latest changes
- Provides colored output for better visibility

## Requirements

- Git
- Bash shell
- Access to fathom-io GitHub repositories

## Development

To add new utilities:
1. Create executable scripts in the `bin` directory
2. Follow the existing naming conventions
3. Include help text and error handling
4. Test scripts before committing

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is part of the Fathom platform tooling.