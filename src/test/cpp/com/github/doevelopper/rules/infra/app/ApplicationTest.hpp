
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_APP_APPLICATIONTEST_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_APP_APPLICATIONTEST_HPP

#include <com/github/doevelopper/rules/infra/app/Application.hpp>
#include <gtest/gtest.h>

namespace com::github::doevelopper::rules::infra::app::test
{
    class ApplicationTest : public ::testing::Test
    {
    public:

        ApplicationTest();
        ApplicationTest(const ApplicationTest&) = delete;
        ApplicationTest(ApplicationTest&&) = delete;
        ApplicationTest& operator=(const ApplicationTest&) = delete;
        ApplicationTest& operator=(ApplicationTest&&) = delete;
        virtual ~ApplicationTest();

        void SetUp() override;
        void TearDown() override;

    protected:
        com::github::doevelopper::rules::infra::app::Application * m_targetUnderTest;
    private:
    };
}
#endif
