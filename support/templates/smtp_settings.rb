# To enable smtp email delivery for your GitLab instance do next:
# 1. Rename this file to smtp_settings.rb
# 2. Edit settings inside this file
# 3. Restart GitLab instance
#
if Rails.env.production?\
	Gitlab::Application.config.action_mailer.perform_deliveries = true

	Gitlab::Application.config.action_mailer.raise_delivery_errors = true
  Gitlab::Application.config.action_mailer.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    address: "{{SMTP_HOST}}",
    port: {{SMTP_PORT}},
    user_name: "{{SMTP_USER}}",
    password: "{{SMTP_PASS}}",
    authentication: :plain,
    enable_starttls_auto: {{SMTP_STARTTLS}}
  }
end
