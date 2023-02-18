#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_SINGLETON_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_SINGLETON_HPP

#include <boost/serialization/singleton.hpp>

namespace com::github::doevelopper::rules::infra::logging
{
    template <typename T>
    class Singleton : boost::serialization::singleton<T>
    {
    private:

        Singleton(const Singleton &) noexcept             = default;
        Singleton(Singleton &&) noexcept                  = default;
        Singleton & operator=(const Singleton &) noexcept = default;
        Singleton & operator=(Singleton &&) noexcept      = default;
        virtual ~Singleton() noexcept;

    public:

        using object_type = T;
        static object_type & instance()
        {
            return boost::serialization::singleton<T>::get_mutable_instance();
        }

        // Befriend to allow your singleton class to have a private constructor
        using friend_type = boost::serialization::detail::singleton_wrapper<T>;

    protected:
    private:

        Singleton() noexcept;
    };
}
#endif
