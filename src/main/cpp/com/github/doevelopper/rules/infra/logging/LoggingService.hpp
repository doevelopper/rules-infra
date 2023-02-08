
#ifndef COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICE_HPP
#define COM_GITHUB_DOEVELOPPER_RULES_INFRA_LOGGING_LOGGINGSERVICE_HPP

namespace com::github::doevelopper::rules::infra::logging
{
	class LoggingService
	{
	 public:
		LoggingService() noexcept;
		LoggingService(const LoggingService&) noexcept = default;
		LoggingService(LoggingService&&) noexcept =  default;
		LoggingService& operator=(const LoggingService&) noexcept = default;
		LoggingService& operator=(LoggingService&&) noexcept = default;
		virtual ~LoggingService() noexcept;
	 protected:
	 private:
	};
}

#endif
