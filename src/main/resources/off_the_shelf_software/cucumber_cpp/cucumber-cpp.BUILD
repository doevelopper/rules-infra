
load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

filegroup(
    name = "all",
    srcs = glob(["**"]),
)

_CACHE_ENTRIES = {
    "BUILD_SHARED_LIBS": "off",
    "BUILD_CURL_EXE": "off",
    # "CMAKE_PREFIX_PATH": "$CMAKE_PREFIX_PATH;$EXT_BUILD_DEPS/boost",
    "CMAKE_C_FLAGS": "-fPIC",
    "CUKE_ENABLE_EXAMPLES": "OFF",
    "CUKE_USE_STATIC_GTEST": "OFF",
    "CUKE_ENABLE_BOOST_TEST": "OFF",
    "CUKE_ENABLE_GTEST": "OFF",
    "CUKE_ENABLE_QT": "OFF",
    "CUKE_TESTS_E2E": "OFF",
    "CUKE_TESTS_UNIT": "OFF",
}

_MACOS_CACHE_ENTRIES = dict(_CACHE_ENTRIES.items() + {
    "CMAKE_AR": "",
    "CMAKE_C_ARCHIVE_CREATE": "",
}.items())

_LINUX_CACHE_ENTRIES = dict(_CACHE_ENTRIES.items() + {
    "CMAKE_C_FLAGS": "$CMAKE_C_FLAGS -fPIC",
}.items())

cmake(
    name = "cucumber_cpp",
    cache_entries = select({
    #     "@bazel_tools//src/conditions:darwin": _MACOS_CACHE_ENTRIES,
    #     "@bazel_tools//src/conditions:linux_x86_64": _LINUX_CACHE_ENTRIES,
        "//conditions:default": _CACHE_ENTRIES,
    }),
    lib_source = ":all",

    # out_interface_libs = select({
    #     "@bazel_tools//src/conditions:windows": ["libcucumber_cpp.lib"],
    #     "//conditions:default": [],
    # }),

    # out_shared_libs = select({
    #     "@bazel_tools//src/conditions:darwin": ["libcucumber_cpp.dylib"],
    #     "@bazel_tools//src/conditions:windows": ["libcucumber_cpp.dll"],
    #     "//conditions:default": ["libcucumber_cpp.so"],
    # }),

    out_static_libs = select({
        # TODO: I'm guessing at this name. Needs to be checked on windows.
        # "@platforms//os:windows": [
        #     "libcucumber-cpp.lib"
        # ],
        "//conditions:default": [
            "libcucumber-cpp.a",
            "libcucumber-cpp-nomain.a",
        ],
    }),
    deps = [
        "@boost//:date_time",
        "@boost//:algorithm",
        "@boost//:program_options",
        "@boost//:asio",
        "@boost//:chrono",
        "@boost//:filesystem",
        "@boost//:locale",
        "@boost//:system",
        "@boost//:thread",
        "@boost//:signals2",
    ],
    visibility = ["//visibility:public"],
)