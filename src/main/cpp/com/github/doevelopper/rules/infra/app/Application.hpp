
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_APP_APPLICATION_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_APP_APPLICATION_HPP

namespace com::github::doevelopper::rules::infra::app
{
    class Application
    {
    public:

        Application();
        Application(const Application&) = delete;
        Application(Application&&) = delete;
        Application& operator=(const Application&) = delete;
        Application& operator=(Application&&) = delete;
        virtual ~Application();
    protected:
    private:
    };
}
#endif
