#!/bin/bash
set -e

# This script configures those stuff, which can't be configured via GITLAB_OMNIBUS_CONFIG.

gitlab-rails runner - <<EOS
ApplicationSetting.last.update(signup_enabled: false)
ApplicationSetting.last.update(first_day_of_week: 1)
EOS

echo "Post Reconfigure Script successfully executed"

