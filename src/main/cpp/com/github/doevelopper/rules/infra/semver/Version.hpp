#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_SEMVER_VERSION_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_SEMVER_VERSION_HPP

namespace com::github::doevelopper::rules::infra::semver
{
    class Version
    {
    public:

        Version();
        Version(const Version&) = delete;
        Version(Version&&) = delete;
        Version& operator=(const Version&) = delete;
        Version& operator=(Version&&) = delete;
        virtual ~Version();
    protected:
    private:
    };
}
#endif
