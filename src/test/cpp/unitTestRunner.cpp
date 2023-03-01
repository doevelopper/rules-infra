
#include <com/github/doevelopper/rules/infra/extensions/UnitTestBuilder.hpp>

#include <iomanip>
#include <iostream>
#include <sstream>

#include <cstdlib>

using namespace com::github::doevelopper::rules::infra::extensions::test;
/*!
 * @brief
 * @param argc number of string arguments passed via argv
 * @param argv array to command line arguments as strings
 *             (an array of character pointers)
 * @return the completion status code (zero indicates success)
 */
int main([[maybe_unused]] int argc, [[maybe_unused]] char ** argv)
{
    std::uint_fast64_t runStatus = 0;

    std::cout << "argc == " << argc << '\n';

    for (int ndx {}; ndx != argc; ++ndx)
    {
        std::cout << "argv[" << ndx << "] == " << std::quoted(argv[ndx]) << '\n';
    }

    std::cout << "argv[" << argc << "] == " << static_cast<void *>(argv[argc]) << '\n';

    try
    {
        UnitTestBuilder unit_test;
        runStatus = unit_test.run(argc, argv);
    }
    catch (const std::exception & e)
    {
        std::cerr << e.what() << std::endl;
        return (EXIT_FAILURE);
    }
    catch (...)
    {
        std::cerr << "unknown exception\n";
        return (EXIT_FAILURE);
    }

    if (runStatus != EXIT_SUCCESS)
    {
        std::cerr << "FAILED!" << std::endl;
    }
    else
    {
        std::cout << "Hello, World!" << std::endl;
    }

    return (runStatus == 0 ? EXIT_SUCCESS : EXIT_FAILURE);
}
