# Distro [![Build Status](https://travis-ci.org/cloudposse/distro.svg?branch=master)](https://travis-ci.org/cloudposse/distro)

Cloud Posse distribution of native apps.

Use this repo to easily install binary releases of popular apps. This is useful for inclusion into a `Dockerfile` to install dependencies.

## Usage

See all available packages:
```
make -C install help
```

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

Add this to a `Dockerfile` to easily install packages:
```
RUN git clone --depth=1 -b master https://github.com/cloudposse/distro.git /distro && \
    rm -rf /distro/.git && \
    make -C /distro/install kubectl
```

Uninstall to a specific package
```
make -C uninstall yq
```

## Makefile Inclusion

Sometimes it's necessary to install some binary dependencies when building projects. For example, we frequently 
rely on `gomplate` or `helm` to build chart packages.

Here's a stub you can include into a `Makefile` to make it easier to install binary dependencies.

```
export DISTRO_VERSION ?= master
export DISTRO_PATH ?= distro/
export INSTALL_PATH ?= $(DISTRO_PATH)/vendor

## Install distro
distro/install:
        @if [ ! -d $(DISTRO_PATH) ]; then \
          echo "Installing distro $(DISTRO_VERSION)..."; \
          rm -rf $(DISTRO_PATH); \
          git clone --depth=1 -b $(DISTRO_VERSION) git@github.com:cloudposse/distro.git $(DISTRO_PATH); \
          rm -rf $(DISTRO_PATH)/.git; \
        fi

## Install package (e.g. helm, helmfile, kubectl)
distro/install/%: distro/install
        @make -C $(DISTRO_PATH)/install $(subst distro/install/,,$@)

## Uninstall package (e.g. helm, helmfile, kubectl)
distro/uninstall/%:
        @make -C $(DISTRO_PATH)/uninstall $(subst distro/uninstall/,,$@)
```


## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/distro/issues), send us an [email](mailto:hello@cloudposse.com) or reach out to us on [Gitter](https://gitter.im/cloudposse/).


## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/distro/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing `distro`, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!


## License

[APACHE 2.0](LICENSE) © 2018 [Cloud Posse, LLC](https://cloudposse.com)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## About

`distro` is maintained and funded by [Cloud Posse, LLC][website].

![Cloud Posse](https://cloudposse.com/logo-300x69.png)


Like it? Please let us know at <hello@cloudposse.com>

We love [Open Source Software](https://github.com/cloudposse/)!

See [our other projects][community]
or [hire us][hire] to help build your next cloud-platform.

  [website]: http://cloudposse.com/
  [community]: https://github.com/cloudposse/
  [hire]: http://cloudposse.com/contact/

### Contributors


| [![Erik Osterman][erik_img]][erik_web]<br/>[Erik Osterman][erik_web] | [![Andriy Knysh][andriy_img]][andriy_web]<br/>[Andriy Knysh][andriy_web] |
|-------------------------------------------------------|------------------------------------------------------------------|

  [erik_img]: http://s.gravatar.com/avatar/88c480d4f73b813904e00a5695a454cb?s=144
  [erik_web]: https://github.com/osterman/
  [andriy_img]: https://avatars0.githubusercontent.com/u/7356997?v=4&u=ed9ce1c9151d552d985bdf5546772e14ef7ab617&s=144
  [andriy_web]: https://github.com/aknysh/
