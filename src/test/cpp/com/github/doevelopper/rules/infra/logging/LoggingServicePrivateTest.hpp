#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICEPRIVATETEST_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICEPRIVATETEST_HPP

#include <com/github/doevelopper/rules/infra/logging/LoggingServicePrivate.hpp>
#include <gtest/gtest.h>

namespace com::github::doevelopper::rules::infra::logging::test
{
    class LoggingServicePrivateTest : public ::testing::Test
    {
    public:

        LoggingServicePrivateTest();
        LoggingServicePrivateTest(const LoggingServicePrivateTest&) = delete;
        LoggingServicePrivateTest(LoggingServicePrivateTest&&) = delete;
        LoggingServicePrivateTest& operator=(const LoggingServicePrivateTest&) = delete;
        LoggingServicePrivateTest& operator=(LoggingServicePrivateTest&&) = delete;
        virtual ~LoggingServicePrivateTest();

        void SetUp() override;
        void TearDown() override;

    protected:
    private:
        com::github::doevelopper::rules::infra::logging::LoggingServicePrivate * m_targetUnderTest;
    };
}
#endif
