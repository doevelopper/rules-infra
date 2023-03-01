# buildifier: disable=module-docstring
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def boost_repositories():
    """Load all repositories needed for boost"""

    BOOST_VERSION = "1.81.0"
    BOOST_SHA = "205666dea9f6a7cfed87c7a6dfbeb52a2c1b9de55712c9c1a87735d7181452b6"
    BOOST_TAG = "1_81_0"
    maybe(
        http_archive,
        name = "org_boost",
        # build_file_content = all_content,
        build_file = Label("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/boost:BUILD.boost.bazel"),
        strip_prefix = "boost_{boost_tag}".format(boost_tag = BOOST_TAG),
        sha256 = BOOST_SHA,
        urls = [
            "https://boostorg.jfrog.io/artifactory/main/release/{boost_version}/source/boost_{boost_tag}.tar.gz".format(boost_version = BOOST_VERSION, boost_tag = BOOST_TAG),
            "https://mirror.bazel.build/boostorg.jfrog.io/artifactory/main/release/{boost_version}/source/boost_{boost_tag}.tar.gz".format(boost_version = BOOST_VERSION, boost_tag = BOOST_TAG),
        ],
    )
