"""A module defining the third party dependency OpenSSL"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def openssl_repositories():
    maybe(
        http_archive,
        name = "com_github_openssl_openssl",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:BUILD.openssl.bazel"),
        sha256 = "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa",
        strip_prefix = "openssl-1.1.1s",
        urls = [
            "https://mirror.bazel.build/www.openssl.org/source/openssl-1.1.1s.tar.gz",
            "https://www.openssl.org/source/openssl-1.1.1s.tar.gz",
            "https://github.com/openssl/openssl/archive/OpenSSL_1_1_1s.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "com_github_openssl_openssl_third",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:BUILD.openssl3.bazel"),
        # sha256 = "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa",
        strip_prefix = "openssl-openssl-3.0.7",
        urls = [
            "https://github.com/openssl/openssl/archive/refs/tags/openssl-3.0.7.tar.gz",
            "https://www.openssl.org/source/openssl-3.0.7.tar.gz",
            "https://github.com/openssl/openssl/releases/download/openssl-3.0.7/openssl-3.0.7.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "us_nasm_nasm",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:BUILD.nasm.bazel"),
        sha256 = "c77745f4802375efeee2ec5c0ad6b7f037ea9c87c92b149a9637ff099f162558",
        strip_prefix = "nasm-2.16.01",
        urls = [
            "https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.xz",
            "https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.xz",
        ],
    )

    maybe(
        http_archive,
        name = "rules_perl",
        sha256 = "391edb08802860ba733d402c6376cfe1002b598b90d2240d9d302ecce2289a64",
        strip_prefix = "rules_perl-7f10dada09fcba1dc79a6a91da2facc25e72bd7d",
        urls = [
            "https://github.com/bazelbuild/rules_perl/archive/7f10dada09fcba1dc79a6a91da2facc25e72bd7d.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "perl",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:BUILD.perl.bazel"),
        sha256 = "aeb973da474f14210d3e1a1f942dcf779e2ae7e71e4c535e6c53ebabe632cc98",
        urls = [
            "https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.zip",
            "https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.zip",
        ],
    )
