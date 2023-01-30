"""A module defining the third party dependency zlib"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

NET_ZLIB_SHA = "1525952a0a567581792613a9723333d7f8cc20b87a81f920fb8bc7e3f2251428"
NET_ZLIB_VERSION = "1.2.13"

def zlib_repositories():

    maybe(
        http_archive,
        name = "net_zlib_zlib",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/zlib:BUILD.zlib.bazel"),
        # sha256 = NET_ZLIB_SHA,
        strip_prefix = "zlib-{}".format(NET_ZLIB_VERSION),
        urls = [
            "https://www.zlib.net/fossils/zlib-{}.tar.gz".format(NET_ZLIB_VERSION),
            "https://storage.googleapis.com/mirror.tensorflow.org/zlib.net/zlib-{}.tar.gz",
        ],
    )
