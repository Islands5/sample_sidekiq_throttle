require 'sidekiq/web'
require 'sidekiq/throttled'

redis_config = YAML.safe_load(ERB.new(Rails.root.join('config', 'redis.yml').read).result, [], [], true)[Rails.env]

Sidekiq.configure_server do |config|
  config.redis = {
    host: redis_config['host'],
    port: redis_config['port'],
    db:   '1'
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    host: redis_config['host'],
    port: redis_config['port'],
    db:   '1'
  }
end

Sidekiq::Throttled.setup!
