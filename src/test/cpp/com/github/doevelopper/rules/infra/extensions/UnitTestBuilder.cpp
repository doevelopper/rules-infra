
#include <com/github/doevelopper/rules/infra/extensions/UnitTestBuilder.hpp>

using com::github::doevelopper::rules::infra::logging;
using namespace com::github::doevelopper::rules::infra::extensions::test;

UnitTestBuilder::UnitTestBuilder()
    : m_testSuites(std::string())
    , m_numberOfTestIteration(1)
// , m_loggerService(new LoggingService(LOGGER_WATCH_DELAY))
{
    // LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

UnitTestBuilder::UnitTestBuilder(std::string & suite, unsigned int iteration)
    : m_testSuites(suite)
    , m_numberOfTestIteration(iteration)
{
}

UnitTestBuilder::~UnitTestBuilder()
{
    // LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    if (m_loggerService)
    {
        delete this->m_loggerService;
        m_loggerService = nullptr;
    }
}

void UnitTestBuilder::showUsage(std::string name)
{
    std::cerr << "Usage: " << name << " <option(s)> SOURCES \n"
              << "Options:\n"
              << "\t-h,--help \t Show this help message\n"
              << "\t-i,--iterration \t Number of iteration on test Default 1\n"
              << "\t-o,--outputpath \t Specify the destination path Default netx to executable\n"
              << "\t-m,--module \t The name of xml test report to be generated\n"
              << "\t-l,--list \t Specify the list of tests to be executed Default netx to executable\n"
              << std::endl;
}
