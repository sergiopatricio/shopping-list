# frozen_string_literal: true

# Configuration details:
# https://github.com/airbrake/airbrake-ruby#configuration
Airbrake.configure do |c|
  c.project_id = ENV.fetch('AIRBRAKE_PROJECT_ID', nil)
  c.project_key = ENV.fetch('AIRBRAKE_API_KEY', nil)

  c.root_directory = Rails.root
  c.logger = Airbrake::Rails.logger
  c.environment = Rails.env
  c.ignore_environments = %w[test development]
  c.blocklist_keys = [/password/i, /authorization/i]
end

Airbrake.add_filter do |notice|
  notice.ignore! if notice.stash[:exception].is_a?(SignalException)
end
