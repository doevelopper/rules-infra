"""Our "development" dependencies

Users should *not* need to install these. If users see a load()
statement from these, that's a bug in our distribution.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def http_archive(name, **kwargs):
    maybe(_http_archive, name = name, **kwargs)

def rules_infra_internal_deps():
    "Fetch deps needed for local development"
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "56d8c5a5c91e1af73eca71a6fab2ced959b67c86d12ba37feedb0a2dfea441a6",
        urls = ["https://github.com/bazelbuild/rules_go/releases/download/v0.37.0/rules_go-v0.37.0.zip"],
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = "ecba0f04f96b4960a5b250c8e8eeec42281035970aa8852dda73098274d14a1d",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.29.0/bazel-gazelle-v0.29.0.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.29.0/bazel-gazelle-v0.29.0.tar.gz",
        ],
    )

    # Override bazel_skylib distribution to fetch sources instead
    # so that the gazelle extension is included
    # see https://github.com/bazelbuild/bazel-skylib/issues/250

    http_archive(
        name = "bazel_skylib",
        sha256 = "3b620033ca48fcd6f5ef2ac85e0f6ec5639605fa2f627968490e52fc91a9932f",
        strip_prefix = "bazel-skylib-1.3.0",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/refs/tags/1.3.0.tar.gz"],
    )

    ##Add a BUILD file to a directory to mark it as a package. and referenced by '//src/main/resources/starlark:gazelle_bin'
    # http_archive(
    #     name = "bazel_skylib",
    #     sha256 = "f24ab666394232f834f74d19e2ff142b0af17466ea0c69a3f4c276ee75f6efce",
    #     urls = [
    #         "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.0/bazel-skylib-1.4.0.tar.gz",
    #         "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.0/bazel-skylib-1.4.0.tar.gz",
    #     ],
    # )

    http_archive(
        name = "io_bazel_stardoc",
        sha256 = "3fd8fec4ddec3c670bd810904e2e33170bedfe12f90adf943508184be458c8bb",
        urls = ["https://github.com/bazelbuild/stardoc/releases/download/0.5.3/stardoc-0.5.3.tar.gz"],
    )

    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "79623d656aa23ad3fd4692ab99786c613cd36e49f5566469ed97bc9b4c655f03",
        strip_prefix = "bazel-lib-1.23.3",
        url = "https://github.com/aspect-build/bazel-lib/archive/refs/tags/v1.23.3.tar.gz",
    )

    http_archive(
        name = "rules_pkg",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.8.0/rules_pkg-0.8.0.tar.gz",
            "https://github.com/bazelbuild/rules_pkg/releases/download/0.8.0/rules_pkg-0.8.0.tar.gz",
        ],
        sha256 = "eea0f59c28a9241156a47d7a8e32db9122f3d50b505fae0f33de6ce4d9b61834",
    )

    http_archive(
        name = "com_github_bazelbuild_buildtools",
        sha256 = "ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3",
        strip_prefix = "buildtools-4.2.2",
        urls = [
            "https://github.com/bazelbuild/buildtools/archive/refs/tags/4.2.2.tar.gz",
        ],
    )

    # http_archive(
    #     name = "rules_foreign_cc",
    #     sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
    #     strip_prefix = "rules_foreign_cc-0.9.0",
    #     url = "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.9.0.tar.gz",
    # )
   # this version contains procedure  runnable_binary  need to build openssl
    http_archive(
        name = "rules_foreign_cc",
        sha256 = "ff5b7cdb650377b5baf358e38abf7d849395add601116393b16e722ffb33eb4b",
        strip_prefix = "rules_foreign_cc-34fa6a796d6933cc0529950fee313579cd0d8c51",
        urls = [
            "https://github.com/bazelbuild/rules_foreign_cc/archive/34fa6a796d6933cc0529950fee313579cd0d8c51.tar.gz",
        ],
    )

    http_archive(
        name = "rules_cc",
        urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.4/rules_cc-0.0.4.tar.gz"],
        sha256 = "af6cc82d87db94585bceeda2561cb8a9d55ad435318ccb4ddfee18a43580fb5d",
        strip_prefix = "rules_cc-0.0.4",
    )

    http_archive(
        name = "com_github_google_rules_install",
        urls = [
            "https://github.com/google/bazel_rules_install/releases/download/0.4/bazel_rules_install-0.4.tar.gz",
        ],
        sha256 = "ac2c9c53aa022a110273c0e510d191a4c04c6adafefa069a5eeaa16313edc9b9",
        strip_prefix = "bazel_rules_install-0.4",
    )

    http_archive(
        name = "platforms",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/platforms/releases/download/0.0.6/platforms-0.0.6.tar.gz",
            "https://github.com/bazelbuild/platforms/releases/download/0.0.6/platforms-0.0.6.tar.gz",
        ],
        sha256 = "5308fc1d8865406a49427ba24a9ab53087f17f5266a7aabbfc28823f3916e1ca",
    )

    # http_archive(
    #     name = "rules_python",
    #     sha256 = "48a838a6e1983e4884b26812b2c748a35ad284fd339eb8e2a6f3adf95307fbcd",
    #     strip_prefix = "rules_python-0.16.2",
    #     url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.16.2.tar.gz",
    # )

    http_archive(
        name = "rules_python",
        sha256 = "8c15896f6686beb5c631a4459a3aa8392daccaab805ea899c9d14215074b60ef",
        strip_prefix = "rules_python-0.17.3",
        url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.17.3.tar.gz",
    )

    http_archive(
        name = "bazel_toolchains",
        urls = ["https://github.com/bazelbuild/bazel-toolchains/archive/03bb68c854a9268bcf68d1138dc00b09cd928cff.tar.gz"],
        strip_prefix = "bazel-toolchains-03bb68c854a9268bcf68d1138dc00b09cd928cff",
        # sha256 = "56d5370eb99559b4c74f334f81bc8a298f728bd16d5a4333c865c2ad10fae3bc",
    )

    http_archive(
        name = "rules_license",
        urls = [
            "https://github.com/bazelbuild/rules_license/releases/download/0.0.4/rules_license-0.0.4.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/rules_license/releases/download/0.0.4/rules_license-0.0.4.tar.gz",
        ],
        sha256 = "6157e1e68378532d0241ecd15d3c45f6e5cfd98fc10846045509fb2a7cc9e381",
    )

    http_archive(
        name = "rules_fuzzing",
        sha256 = "d9002dd3cd6437017f08593124fdd1b13b3473c7b929ceb0e60d317cb9346118",
        strip_prefix = "rules_fuzzing-0.3.2",
        urls = ["https://github.com/bazelbuild/rules_fuzzing/archive/v0.3.2.zip"],
    )

    http_archive(
        name = "build_bazel_rules_apple",
        sha256 = "43737f28a578d8d8d7ab7df2fb80225a6b23b9af9655fcdc66ae38eb2abcf2ed",
        url = "https://github.com/bazelbuild/rules_apple/releases/download/2.0.0/rules_apple.2.0.0.tar.gz",
    )

    http_archive(
        name = "rules_perl",
        sha256 = "391edb08802860ba733d402c6376cfe1002b598b90d2240d9d302ecce2289a64",
        strip_prefix = "rules_perl-7f10dada09fcba1dc79a6a91da2facc25e72bd7d",
        urls = [
            "https://github.com/bazelbuild/rules_perl/archive/7f10dada09fcba1dc79a6a91da2facc25e72bd7d.tar.gz",
        ],
    )

    http_archive(
        name = "perl",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:BUILD.perl.bazel"),
        sha256 = "aeb973da474f14210d3e1a1f942dcf779e2ae7e71e4c535e6c53ebabe632cc98",
        urls = [
            "https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.zip",
            "https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.zip",
        ],
    )

    # maybe(
    #     http_archive,
    #     name = "perl",
    #     build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:BUILD.perl.bazel"),
    #     sha256 = "aeb973da474f14210d3e1a1f942dcf779e2ae7e71e4c535e6c53ebabe632cc98",
    #     urls = [
    #         "https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.zip",
    #         "https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.zip",
    #     ],
    # )
    # # Register toolchains for tests
    # register_jq_toolchains()
    # register_yq_toolchains()
    # register_coreutils_toolchains()
