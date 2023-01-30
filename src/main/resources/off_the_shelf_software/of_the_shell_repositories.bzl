"""
    A centralized module defining all repositories required for my OSS projects
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/zlib:zlib_repositories.bzl", "zlib_repositories")

# buildifier: disable=unnamed-macro
def of_the_shell_repositories():
  """
    Load all repositories needed for the targets of rules_foreign_cc_examples_third_party
  """
  zlib_repositories()
