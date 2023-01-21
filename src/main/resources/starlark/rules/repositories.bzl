"""Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@com.github.doevelopper.rules-infra//src/main/resources/starlark/rules/private:toolchains_repo.bzl", "PLATFORMS", "toolchains_repo")
load("@com.github.doevelopper.rules-infra//src/main/resources/starlark/rules/private:versions.bzl", "TOOL_VERSIONS")

def http_archive(name, **kwargs):
    maybe(_http_archive, name = name, **kwargs)

# WARNING: any changes in this function may be BREAKING CHANGES for users
# because we'll fetch a dependency which may be different from one that
# they were previously fetching later in their WORKSPACE setup, and now
# ours took precedence. Such breakages are challenging for users, so any
# changes in this function should be marked as BREAKING in the commit message
# and released only in semver majors.
# This is all fixed by bzlmod, so we just tolerate it for now.
def rules_infra_register_dependencies():
    # The minimal version of bazel_skylib we require
    http_archive(
        name = "bazel_skylib",
        sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        ],
    )

########
# Remaining content of the file is only used to support toolchains.
########
_DOC = "Fetch external tools needed for rules_infra toolchain"
_ATTRS = {
    "rules_infra_version": attr.string(mandatory = True, values = TOOL_VERSIONS.keys()),
    "platform": attr.string(mandatory = True, values = PLATFORMS.keys()),
}

def _rules_infra_repo_impl(repository_ctx):
    url = "https://github.com/doevelopper/rules-infra/releases/download/v{0}/rules-infra-{1}.zip".format(
        repository_ctx.attr.rules_infra_version,
        repository_ctx.attr.platform,
    )
    repository_ctx.download_and_extract(
        url = url,
        integrity = TOOL_VERSIONS[repository_ctx.attr.rules_infra_version][repository_ctx.attr.platform],
    )
    build_content = """#Generated by rules_infra/repositories.bzl
load("@com.github.doevelopper.rules-infra//src/main/resources/starlark/rules:toolchain.bzl", "rules_infra_toolchain")
rules_infra_toolchain(name = "rules_infra_toolchain", target_tool = select({
        "@bazel_tools//src/conditions:host_windows": "rules_infra.exe",
        "//conditions:default": "rules_infra_tool",
    }),
)
"""

    # Base BUILD file for this repository
    repository_ctx.file("BUILD.bazel", build_content)

rules_infra_repositories = repository_rule(
    _rules_infra_repo_impl,
    doc = _DOC,
    attrs = _ATTRS,
)

# Wrapper macro around everything above, this is the primary API
def rules_infra_register_toolchains(name, **kwargs):
    """Convenience macro for users which does typical setup.

    - create a repository for each built-in platform like "mylang_linux_amd64" -
      this repository is lazily fetched when node is needed for that platform.
    - TODO: create a convenience repository for the host platform like "mylang_host"
    - create a repository exposing toolchains for each platform like "mylang_platforms"
    - register a toolchain pointing at each platform
    Users can avoid this macro and do these steps themselves, if they want more control.
    Args:
        name: base name for all created repos, like "mylang1_14"
        **kwargs: passed to each node_repositories call
    """
    for platform in PLATFORMS.keys():
        rules_infra_repositories(
            name = name + "_" + platform,
            platform = platform,
            **kwargs
        )
        native.register_toolchains("@%s_toolchains//:%s_toolchain" % (name, platform))

    toolchains_repo(
        name = name + "_toolchains",
        user_repository_name = name,
    )
