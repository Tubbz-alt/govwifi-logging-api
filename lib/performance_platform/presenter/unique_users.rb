class PerformancePlatform::Presenter::UniqueUsers
  def present(stats:)
    @stats = stats
    @timestamp = generate_timestamp

    {
      metric_name: stats[:metric_name],
      payload: [
        {
          _id: encode_id,
          _timestamp: timestamp,
          dataType: stats[:metric_name],
          period: stats[:period],
          count: stats[:count]
        }
      ]
    }
  end

private

  def generate_timestamp
    "#{Date.today - 1}T00:00:00+00:00"
  end

  def encode_id
    Common::Base64.encode_array(
      [
        timestamp,
        ENV.fetch('PERFORMANCE_DATASET'),
        stats[:period],
        stats[:metric_name]
      ]
    )
  end

  attr_reader :stats, :timestamp
end
