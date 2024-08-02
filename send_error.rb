require 'newrelic_rpm'

begin
  raise 'MyAwesomeError'
rescue => e
  puts e
  puts "Logging exception to NewRelic: #{e}"
  NewRelic::Agent.notice_error(e)
  NewRelic::Agent.record_custom_event('GdprKinesisConsumerHeartbeatEvent', {})
end