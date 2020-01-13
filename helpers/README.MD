## Packages Helpers

This folder contains useful scripts for contributing new packages to this project.

Requirements:
- whiptail
- jq
- gomplate
- curl
- bash

## Usage

Currently the only helper utility is one that helps create the vendor/app folder for a new application using simple dialog prompts and some templated deployments.

```bash
make
```

The produced output should be validated and tested for both local installation and APK packaging.