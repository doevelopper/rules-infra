"""
    A centralized module defining all repositories required for my OSS projects
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/apr:apr_repositories.bzl", "apr_repositories")
load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/expat:expat_repositories.bzl","expat_repositories")
load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/apr_util:apr_util_repositories.bzl", "apr_util_repositories")
load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/zlib:zlib_repositories.bzl", "zlib_repositories")

load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/xerces:xerces_repositories.bzl", "xerces_repositories")
load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/rapidjson:rapidjson_repositories.bzl","rapidjson_repositories")
load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/log4cxx:log4cxx_repositories.bzl","log4cxx_repositories")
# load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:openssl_repositories.bzl","openssl_repositories")
# load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openssl:openssl_setup.bzl","openssl_setup")
# load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/ace_tao:ace_tao_repositories.bzl", "ace_tao_repositories")
# load("@com.github.doevelopper.rules-infra//src/main/resources/off_the_shelf_software/openDDS:opendds_repositories.bzl", "opendds_repositories")
# buildifier: disable=unnamed-macro
def of_the_shell_repositories():
  """
    Load all repositories needed for the targets of rules_foreign_cc_examples_third_party
  """
  zlib_repositories()
  apr_repositories()
  expat_repositories()
  apr_util_repositories()
  log4cxx_repositories()
  xerces_repositories()
  rapidjson_repositories()
  # openssl_repositories()
  # openssl_setup()
  # ace_tao_repositories()
  # opendds_repositories()
