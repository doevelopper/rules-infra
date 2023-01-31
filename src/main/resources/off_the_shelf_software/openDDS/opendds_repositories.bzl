"""A module defining the third party dependency xerces"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def opendds_repositories():
    maybe(
        http_archive,
        name = "com_github_docgroup_opendds",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openDDS:opendds.BUILD"),
        sha256 = "d4b01ed07fefbca56b8799e8a37e3fe466896701d9d08427d4ec7436c6d041ee",
        strip_prefix = "OpenDDS-3.23",
        urls = [
            "https://github.com/OpenDDS/OpenDDS/releases/download/DDS-3.23/OpenDDS-3.23.tar.gz",
            "https://github.com/OpenDDS/OpenDDS/releases/download/DDS-3.23/OpenDDS-3.23.zip",
        ],
    )
