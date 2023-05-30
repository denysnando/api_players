Sidekiq.configure_server do |config|
  config.strict_args!
  config.redis = { url: Rails.application.credentials.dig(:redis, Rails.env&.to_sym, :url) }
end

Sidekiq.configure_client do |config|
  config.strict_args!
  config.redis = { url: Rails.application.credentials.dig(:redis, Rails.env&.to_sym, :url) }
end

schedule_file = "config/schedule.yml"

if File.exist?(schedule_file) && Sidekiq.server?
   Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
