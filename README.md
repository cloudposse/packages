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

[APACHE 2.0](LICENSE) © 2017-2018 [Cloud Posse, LLC](https://cloudposse.com)

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
