

#include <com/github/doevelopper/rules/infra/app/Application.hpp>

using namespace com::github::doevelopper::rules::infra::app;
using namespace com::github::doevelopper::rules::infra::logging;
using namespace com::github::doevelopper::rules::infra::semver;

log4cxx::LoggerPtr Application::logger =
    log4cxx::Logger::getLogger(std::string("com.github.doevelopper.rules.infra.app.Application"));

Application::Application() noexcept
    : m_loggerService(new LoggingService())
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

Application::~Application() noexcept
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
