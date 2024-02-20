## Additional configuration to perform after deploying the GitLab server.

### First thing before modifying anything on server is to set the `root` user password and email address.
- https://docs.gitlab.com/ee/administration/get_started.html
- https://docs.gitlab.com/ee/install/next_steps.html

```Please note that followings configuration may not be accurate for every deployments. These settings allowed Admin to make sure the GitLab server is configured with necessary additional configuration.```

## Navigate to the `Admin Area -> Settings` for modifying system-wide settings.

### General Settings.
- Visibility and access controls.
	- Default project creation protection - `Maintainers`
- Account and limit.
	- Session duration (minutes) - `1440`
- Sign-up restrictions.
	- `Disable` Sign-up enabled.
	- Require admin approval for new sign-ups.
	- Minimum password length (number of characters) - `12`.
	- Allowed domains for sign-ups - `mydomain.com`
- Sign-in restrictions.
	- Allow password authentication for the web interface.
	- Allow password authentication for Git over HTTP(S).
- PlantUML.
	- `Enable` PlantUML.
	- PlantUML URL - `https://gitlab.mydomain.com/-/plantuml/`
- Email notification for unknown sign-ins.
	- `Enable` email notification.
- Customer experience improvement and third-party offers.
	- Do not display content for customer experience improvement and offers from third parties.

### Repository Settings.
- Repository mirroring
	- Repository mirroring configuration.
		- `Disable` - Allow project maintainers to configure repository mirroring.

### CI/CD Settings.
- Variables.
	- We can add global variables that will be available in all projects.
- Continuous Integration and Deployment.
	- `Enable` - Default to Auto DevOps pipeline for all projects.
	- `Enable` - Enable shared runners for new projects.
	- Maximum artifacts size (MB) - `1024`
	- Default artifacts expiration - `7 days`
	- `Disable` - Keep the latest artifacts for all jobs in the latest successful pipelines.

### Reporting Settings.
- Abuse reports.
	- `Add Admin email` for abuse report notifications.

### Metrics and Profiling Settings.
- Usage statistics.
	- `Disable` - Enable Service Ping.

### Network Settings.
- Performance optimization.
	- `Enable` - Use authorized_keys file to authenticate SSH keys.
- Protected paths
	- `Enable` - Enable rate limiting for requests to the specified paths.
