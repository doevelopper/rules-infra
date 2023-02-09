
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_SEMVER_GITREVISIONTEST_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_SEMVER_GITREVISIONTEST_HPP

#include <com/github/doevelopper/rules/infra/semver/Version.hpp>
#include <gtest/gtest.h>

namespace com::github::doevelopper::rules::infra::semver::test
{
    class VersionTest : public ::testing::Test
    {
    public:

        VersionTest();
        VersionTest(const VersionTest&) = delete;
        VersionTest(VersionTest&&) = delete;
        VersionTest& operator=(const VersionTest&) = delete;
        VersionTest& operator=(VersionTest&&) = delete;
        virtual ~VersionTest();

        void SetUp() override;
        void TearDown() override;

    protected:
        com::github::doevelopper::rules::infra::semver::Version * m_targetUnderTest;
    private:
    };
}
#endif
