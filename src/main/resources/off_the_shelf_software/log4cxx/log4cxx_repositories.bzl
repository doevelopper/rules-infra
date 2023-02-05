"""A module defining the third party dependency apr"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def log4cxx_repositories():
    # maybe(
    #     http_archive,
    #     name = "log4cxx",
    #     build_file = Label("//log4cxx:BUILD.log4cxx.bazel"),
    #     sha256 = "0de0396220a9566a580166e66b39674cb40efd2176f52ad2c65486c99c920c8c",
    #     strip_prefix = "apache-log4cxx-0.10.0",
    #     patches = [
    #         # See https://issues.apache.org/jira/browse/LOGCXX-360
    #         Label("//log4cxx:console.cpp.patch"),
    #         Label("//log4cxx:inputstreamreader.cpp.patch"),
    #         Label("//log4cxx:socketoutputstream.cpp.patch"),

    #         # Required for building on MacOS
    #         Label("//log4cxx:simpledateformat.h.patch"),
    #     ],
    #     urls = [
    #         "https://mirror.bazel.build/archive.apache.org/dist/logging/log4cxx/0.10.0/apache-log4cxx-0.10.0.tar.gz",
    #         "https://archive.apache.org/dist/logging/log4cxx/0.10.0/apache-log4cxx-0.10.0.tar.gz",
    #     ],
    # )

    maybe(
        http_archive,
        name = "org_apache_log4cxx",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/log4cxx:BUILD.log4cxx.bazel"),
        sha256 = "6df9f1f682650de6045309473d5b2fe1f798a03ceb36a74a5b21f5520962d32f",
        strip_prefix = "apache-log4cxx-1.0.0",
        urls = [
            "https://archive.apache.org/dist/logging/log4cxx/1.0.0/apache-log4cxx-1.0.0.tar.gz",
            "https://github.com/apache/logging-log4cxx/archive/refs/tags/rel/v1.0.0.tar.gz",
        ],
    )
