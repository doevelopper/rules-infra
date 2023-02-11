
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICETEST_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICETEST_HPP

#include <com/github/doevelopper/rules/infra/logging/LoggingService.hpp>
#include <gtest/gtest.h>

namespace com::github::doevelopper::rules::infra::logging::test
{
    class LoggingServiceTest : public ::testing::Test
    {
    public:

        LoggingServiceTest();
        LoggingServiceTest(const LoggingServiceTest &)             = delete;
        LoggingServiceTest(LoggingServiceTest &&)                  = delete;
        LoggingServiceTest & operator=(const LoggingServiceTest &) = delete;
        LoggingServiceTest & operator=(LoggingServiceTest &&)      = delete;
        virtual ~LoggingServiceTest();

        void SetUp() override;
        void TearDown() override;

    protected:

        com::github::doevelopper::rules::infra::logging::LoggingService * m_targetUnderTest;

    private:
    };
}

#endif
