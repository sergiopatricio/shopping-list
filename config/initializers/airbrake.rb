# frozen_string_literal: true

# Configuration details:
# https://github.com/airbrake/airbrake-ruby#configuration
Airbrake.configure do |c|
  c.project_id = ENV['AIRBRAKE_PROJECT_ID']
  c.project_key = ENV['AIRBRAKE_API_KEY']

  c.root_directory = Rails.root
  c.logger = Airbrake::Rails.logger
  c.environment = Rails.env
  c.ignore_environments = %w[test development]
  c.blacklist_keys = [/password/i, /authorization/i]
end

Airbrake.add_filter do |notice|
  notice.ignore! if notice.stash[:exception].is_a?(SignalException)
end
