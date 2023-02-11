
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICE_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICE_HPP

#include <com/github/doevelopper/rules/infra/API_Export.hpp>

namespace com::github::doevelopper::rules::infra::logging
{
    class LoggingServicePrivate;
    class LoggingService
    {
    public:

        LoggingService() noexcept;
        LoggingService(const LoggingService &) noexcept             = default;
        LoggingService(LoggingService &&) noexcept                  = default;
        LoggingService & operator=(const LoggingService &) noexcept = default;
        LoggingService & operator=(LoggingService &&) noexcept      = default;
        virtual ~LoggingService() noexcept;

        explicit LoggingService(unsigned long delay);
        void configure();

        SDLC_DEPRECATED_MSG("Replaced by LOG4CXX_TRACE macro, which has an improved interface")
        void trace(const std::string & s);
        SDLC_DEPRECATED_MSG("Replaced by LOG4CXX_BEBUG macro, which has an improved interface")
        void debug(const std::string & s);
        SDLC_DEPRECATED_MSG("Replaced by LOG4CXX_INFO macro, which has an improved interface")
        void info(const std::string & s);
        SDLC_DEPRECATED_MSG("Replaced by LOG4CXX_WARN macro, which has an improved interface")
        void warn(const std::string & s);
        SDLC_DEPRECATED_MSG("Replaced by LOG4CXX_ERROR macro, which has an improved interface")
        void error(const std::string & s);
        SDLC_DEPRECATED_MSG("Replaced by LOG4CXX_FATAL macro, which has an improved interface")
        void fatal(const std::string & s);
        void flush();

    protected:
    private:

        std::shared_ptr<LoggingServicePrivate> d_ptr;
        Q_DECLARE_PRIVATE(LoggingService)
    };
}

#endif
