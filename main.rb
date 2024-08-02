require 'newrelic_rpm'

class MyProcess
  def run
    loop do
      NewRelic::Agent.record_custom_event('GdprKinesisConsumerHeartbeatEvent', {})
      
      case rand(1..10)
      when 1..3
        puts 'Pepa'
      when 4..6
        puts 'Candi'
      when 7..10
        begin
          raise "Exception:Using#{NewRelic::VERSION::STRING}"
        rescue => e
          puts e
          puts "Logging exception to NewRelic: #{e}"
          NewRelic::Agent.notice_error(e)
        end
      end

      sleep 5
    end
  end
end

MyProcess.new.run
