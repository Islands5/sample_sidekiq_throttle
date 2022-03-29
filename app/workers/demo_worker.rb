class DemoWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker
  sidekiq_options queue: 'email', retry: 1

  sidekiq_throttle(
    :concurrency => { :limit => 1, :key_suffix => -> (sample_id) { sample_id }},
  )

  def perform(sample_id)
    puts("メール送信開始#{sample_id}")
    sleep(60)
    puts("メール送信終わり#{sample_id}")
  end
end
