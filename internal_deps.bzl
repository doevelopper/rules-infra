"""Our "development" dependencies

Users should *not* need to install these. If users see a load()
statement from these, that's a bug in our distribution.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def http_archive(name, **kwargs):
    maybe(_http_archive, name = name, **kwargs)

def rules_mylang_internal_deps():
    "Fetch deps needed for local development"
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "56d8c5a5c91e1af73eca71a6fab2ced959b67c86d12ba37feedb0a2dfea441a6",
        urls = ["https://github.com/bazelbuild/rules_go/releases/download/v0.37.0/rules_go-v0.37.0.zip"],
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = "448e37e0dbf61d6fa8f00aaa12d191745e14f07c31cabfa731f0c8e8a4f41b97",
        urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz"],
    )

    # Override bazel_skylib distribution to fetch sources instead
    # so that the gazelle extension is included
    # see https://github.com/bazelbuild/bazel-skylib/issues/250
    http_archive(
        name = "bazel_skylib",
        sha256 = "060426b186670beede4104095324a72bd7494d8b4e785bf0d84a612978285908",
        strip_prefix = "bazel-skylib-1.4.1",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/refs/tags/1.4.1.tar.gz"],
    )

    http_archive(
        name = "io_bazel_stardoc",
        sha256 = "3fd8fec4ddec3c670bd810904e2e33170bedfe12f90adf943508184be458c8bb",
        urls = ["https://github.com/bazelbuild/stardoc/releases/download/0.5.3/stardoc-0.5.3.tar.gz"],
    )

    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "a7bfc7aed7b86a4caaba382116e0214ebbaa623f393a9e716d87a3e1bab29d78",
        strip_prefix = "bazel-lib-1.19.0",
        url = "https://github.com/aspect-build/bazel-lib/archive/refs/tags/v1.19.0.tar.gz",
    )
