# Distro [![Build Status](https://travis-ci.org/cloudposse/distro.svg?branch=master)](https://travis-ci.org/cloudposse/distro)

Cloud Posse distribution of native apps

## Usage

Install everything...
```
make -C install all
```

Install specific packages:
```
make -C install aws-vault chamber
```

Install to a specific folder:
```
make -C install aws-vault INSTALL_PATH=/usr/bin
```
