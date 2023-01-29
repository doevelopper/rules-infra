
load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

filegroup(
    name = "all",
    srcs = glob(["**"]),
)

_CACHE_ENTRIES = {
    "BUILD_SHARED_LIBS": "off",
    "BUILD_CURL_EXE": "off",
    "CMAKE_PREFIX_PATH": "$CMAKE_PREFIX_PATH;$EXT_BUILD_DEPS/boost",
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
        "@bazel_tools//src/conditions:darwin": _MACOS_CACHE_ENTRIES,
        "@bazel_tools//src/conditions:linux_x86_64": _LINUX_CACHE_ENTRIES,
        "//conditions:default": _CACHE_ENTRIES,
    }),
    lib_source = ":all",

    out_interface_libs = select({
        "@bazel_tools//src/conditions:windows": ["libcucumber_cpp.lib"],
        "//conditions:default": [],
    }),

    # out_interface_libs

    out_shared_libs = select({
        "@bazel_tools//src/conditions:darwin": ["libcucumber_cpp.dylib"],
        "@bazel_tools//src/conditions:windows": ["libcucumber_cpp.dll"],
        "//conditions:default": ["libcucumber_cpp.so"],
    }),

    # static_libraries = select({
    #     # TODO: I'm guessing at this name. Needs to be checked on windows.
    #     "@platforms//os:windows": [
    #         "cucumber_cpp.lib"
    #     ],
    #     "//conditions:default": [
    #         "libcucumber_cpp.a"
    #     ],
    # }),
    visibility = ["//visibility:public"],
)
