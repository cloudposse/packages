## Frequently Asked Questions


Here are the answers to several commonly asked questions:

1. <details><summary>When adding a new binary, the `make builder TARGETS=readme` command fails, claiming it can't find the binary file, even though it is in the expected place.</summary> 

    Part of the `make builder TARGETS=readme` command is building a package for the binary inside an Alpine Linux container. Since Alpine Linux uses `musl` as its C library, this often leads to situations where binaries built against `libc` might not function on Alpine. However, binaries from projects written in `Go` that are compiled using `libc` will not be found by the Alpine package builder at all if they are missing any necessary libraries, like `libc`. The solution to this problem is to add a `export APKBUILD_DEPENDS += libc6-compat` line to the top of your new binary's associated `Makefile`. 
    </details>
2.  <details><summary>When adding a new binary, the `make builder TARGETS=readme` command fails with `Unable to find image 'cloudposse/build-harness:sha-[some_SHA_stub]' locally`.</summary>

  This can occur when you have the `cloudposse/build-harness` repository checked out somewhere on your machine. `make builder TARGETS=readme` will end up looking for a docker image tagged with the SHA that the `HEAD` ref of your `buld-harness` points to. To correct this behavior, just run `make init` in the `cloudposse/packages` directory prior to running `make builder TARGETS=readme`.
    </details>
