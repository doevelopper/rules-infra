
#include <com/github/doevelopper/rules/infra/extensions/CustomEnvironment.hpp>
#include <com/github/doevelopper/rules/infra/extensions/GTestEventListener.hpp>
#include <com/github/doevelopper/rules/infra/extensions/UnitTestBuilder.hpp>

using namespace com::github::doevelopper::rules::infra::logging;
using namespace com::github::doevelopper::rules::infra::extensions::test;

log4cxx::LoggerPtr UnitTestBuilder::logger =
    log4cxx::Logger::getLogger(std::string("com.github.doevelopper.rules.infra.extensions.test.UnitTestBuilder"));

UnitTestBuilder::UnitTestBuilder()
    : m_testSuites(std::string())
    , m_numberOfTestIteration(1)
    , m_loggerService(new LoggingService())
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

UnitTestBuilder::UnitTestBuilder(std::string & suite, unsigned int iteration)
    : m_testSuites(suite)
    , m_numberOfTestIteration(iteration)
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}

UnitTestBuilder::~UnitTestBuilder()
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
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

int UnitTestBuilder::run(int argc, char * argv[])
{
    LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
    // ::testing::InitGoogleTest(&argc, argv);
    ::testing::InitGoogleMock(&argc, argv);
    // testing::TestEventListeners & listeners = testing::UnitTest::GetInstance()->listeners();
    // auto default_printer                    = listeners.Release(listeners.default_result_printer());

    // ConfigurableEventListener::Builder(default_printer)
    //     .showEnvironment()
    //     .showTestCases()
    //     .showTestNames()
    //     .showSuccesses()
    //     .showInlineFailures()
    //     .build();

    // listeners.Append(new GTestEventListener);
    // ::testing::AddGlobalTestEnvironment(new CustomEnvironment);// gtest takes ownership of the TestEnvironment ptr -
    // we don't delete it.

    std::uint_fast64_t ret_val = RUN_ALL_TESTS();
    return (ret_val);
}
