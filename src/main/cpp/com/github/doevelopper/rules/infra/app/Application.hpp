
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_APP_APPLICATION_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_APP_APPLICATION_HPP

#include <com/github/doevelopper/rules/infra/semver/Version.hpp>

namespace com::github::doevelopper::rules::infra::app
{
    class Application
    {
        LOG4CXX_DECLARE_STATIC_LOGGER
    public:

        Application() noexcept;
        Application(const Application &)             = delete;
        Application(Application &&)                  = delete;
        Application & operator=(const Application &) = delete;
        Application & operator=(Application &&)      = delete;
        virtual ~Application() noexcept;

    protected:
    private:

        // com::github::doevelopper::rules::infra::semver::Version * m_version;
        com::github::doevelopper::rules::infra::logging::LoggingService * m_loggerService;
    };
}
#endif
