#include <com/github/doevelopper/rules/infra/DummyTest.hpp>

using namespace com::github::doevelopper::rules::infra::guide;
using namespace com::github::doevelopper::rules::infra::guide::test;

DummyTest::DummyTest()
    : m_targetUnderTest()
{
    // LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

DummyTest::~DummyTest()
{
    // LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
}

void DummyTest::SetUp()
{
    // LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    m_targetUnderTest = new OptionDescription();
}

void DummyTest::TearDown()
{
    // LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__ );
    delete m_targetUnderTest;
}

TEST_F(DummyTest, test_not_yedt_implemented)
{
    // LOG4CXX_TRACE(logger, __LOG4CXX_FUNC__);
}
