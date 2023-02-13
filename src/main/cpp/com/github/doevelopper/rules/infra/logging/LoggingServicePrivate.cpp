
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

bool LoggingServicePrivate::initLogger()
{
    LOG4CXX_TRACE(log4cxx::Logger::getRootLogger(), __LOG4CXX_FUNC__);
}

bool LoggingServicePrivate::loggerReset()
{
    LOG4CXX_TRACE(log4cxx::Logger::getRootLogger(), __LOG4CXX_FUNC__);
}

void LoggingServicePrivate::flush()
{
    LOG4CXX_TRACE(log4cxx::Logger::getRootLogger(), __LOG4CXX_FUNC__);
}

void LoggingServicePrivate::trace(const std::string & s)
{
    log4cxx::LogManager::getLoggerRepository()->getRootLogger()->trace(s);
}

void LoggingServicePrivate::debug(const std::string & s)
{
    log4cxx::LogManager::getLoggerRepository()->getRootLogger()->debug(s);
}

void LoggingServicePrivate::info(const std::string & s)
{
    log4cxx::LogManager::getLoggerRepository()->getRootLogger()->info(s);
}

void LoggingServicePrivate::warn(const std::string & s)
{
    log4cxx::LogManager::getLoggerRepository()->getRootLogger()->warn(s);
}

void LoggingServicePrivate::error(const std::string & s)
{
    log4cxx::LogManager::getLoggerRepository()->getRootLogger()->error(s);
}

void LoggingServicePrivate::fatal(const std::string & s)
{
    log4cxx::LogManager::getLoggerRepository()->getRootLogger()->fatal(s);
}
