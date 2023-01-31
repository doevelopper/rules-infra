"""A module defining the third party dependency xerces"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def rapidjson_repositories():
    maybe(
        http_archive,
        name = "com_github_Tencent_rapidjson",
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/rapidjson:rapidjson.BUILD"),
        sha256 = "8e00c38829d6785a2dfb951bb87c6974fa07dfe488aa5b25deec4b8bc0f6a3ab",
        strip_prefix = "rapidjson-1.1.0",
        urls = [
            "https://github.com/Tencent/rapidjson/archive/refs/tags/v1.1.0.zip",
            # "https://github.com/Tencent/rapidjson/archive/refs/tags/v1.1.0.tar.gz",

        ],
    )
