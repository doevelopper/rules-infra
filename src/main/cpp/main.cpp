#include <iostream>
#include <iomanip>
#include <sstream>

#include <cstdlib>



int main(
    [[maybe_unused]] int argc,
    [[maybe_unused]] char**argv)
{

    std::uint_fast64_t runStatus = 0;

    std::cout << "argc == " << argc << '\n';

    for(int ndx{}; ndx != argc; ++ndx)
    {
        std::cout << "argv[" << ndx << "] == " << std::quoted(argv[ndx]) << '\n';
    }

    std::cout << "argv[" << argc << "] == " << static_cast<void*>(argv[argc]) << '\n';

    return (runStatus == 0 ? EXIT_SUCCESS : EXIT_FAILURE);
}
