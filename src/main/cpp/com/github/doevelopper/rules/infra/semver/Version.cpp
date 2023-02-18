
#include <com/github/doevelopper/rules/infra/semver/Version.hpp>

using namespace com::github::doevelopper::rules::infra::semver;

template <typename B>
log4cxx::LoggerPtr Version<B>::logger =
    log4cxx::Logger::getLogger(std::string("com.github.doevelopper.rules.infra.semver"));

template <typename B>
Version<B>::Version() noexcept
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

template <typename B>
Version<B>::~Version() noexcept
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
