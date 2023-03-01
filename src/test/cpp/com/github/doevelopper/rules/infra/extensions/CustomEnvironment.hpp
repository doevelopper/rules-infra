
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_EXTENSIONS_CUSTOMENVIRONMENT_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_EXTENSIONS_CUSTOMENVIRONMENT_HPP

#include <com/github/doevelopper/rules/infra/logging/LoggingService.hpp>

#include <gtest/gtest.h>

namespace com::github::doevelopper::rules::infra::extensions::test
{
    class CustomEnvironment : public ::testing::Environment
    {
        LOG4CXX_DECLARE_STATIC_LOGGER
    public:

        CustomEnvironment();
        CustomEnvironment(const CustomEnvironment &)             = delete;
        CustomEnvironment(CustomEnvironment &&)                  = delete;
        CustomEnvironment & operator=(const CustomEnvironment &) = delete;
        CustomEnvironment & operator=(CustomEnvironment &&)      = delete;
        virtual ~CustomEnvironment();

        virtual void SetUp() override;
        virtual void TearDown() override;

    protected:
    private:
    };
}
#endif
