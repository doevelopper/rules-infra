
#include <com/github/doevelopper/rules/infra/logging/LoggingServicePrivate.hpp>

#include <unistd.h>
#include <filesystem>
#include <iostream>
#include <typeinfo>

using namespace com::github::doevelopper::rules::infra::logging;

LoggingServicePrivate::LoggingServicePrivate()
    : m_watchPeriod(5000UL)
{
}

LoggingServicePrivate::LoggingServicePrivate(unsigned long delay)
    : m_watchPeriod(delay)
{
}

LoggingServicePrivate::~LoggingServicePrivate()
{
    LOG4CXX_TRACE(log4cxx::Logger::getRootLogger(), __LOG4CXX_FUNC__);

    if (log4cxx::LogManager::getLoggerRepository()->isConfigured())
    {
        LOG4CXX_INFO(log4cxx::Logger::getRootLogger(), "---- END LOGGING -----");
    }

    log4cxx::LogManager::shutdown();
}
