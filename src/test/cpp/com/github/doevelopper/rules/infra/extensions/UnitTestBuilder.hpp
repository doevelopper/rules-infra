
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_EXTENSIONS_UNITTESTBUILDER_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_EXTENSIONS_UNITTESTBUILDER_HPP

#include <com/github/doevelopper/rules/infra/logging/LoggingService.hpp>
#include <gtest/gtest.h>

namespace com::github::doevelopper::rules::infra::extensions::test
{
    class UnitTestBuilder
    {
    public:

        UnitTestBuilder();
        UnitTestBuilder(const UnitTestBuilder &)             = delete;
        UnitTestBuilder(UnitTestBuilder &&)                  = delete;
        UnitTestBuilder & operator=(const UnitTestBuilder &) = delete;
        UnitTestBuilder & operator=(UnitTestBuilder &&)      = delete;
        virtual ~UnitTestBuilder();

        UnitTestBuilder(std::string & suite, unsigned int iteration = 1);
        int run(int argc = 0, char * argv[] = NULL);
        static void showUsage(std::string name);

    protected:
    private:

        std::string m_testSuites;
        unsigned int m_numberOfTestIteration;
        static const unsigned long LOGGER_WATCH_DELAY;
        com::github::doevelopper::rules::infra::logging::LoggingService * m_loggerService;
    };
}
#endif
