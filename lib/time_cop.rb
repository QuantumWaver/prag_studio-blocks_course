require 'timeout'

Timeout.timeout(2.0) do
  sleep 0.5
  puts "That was refreshing..."
end

def try_with_timeout(time_limit)
  begin
    Timeout.timeout(time_limit) do
      yield
    end
  rescue Timeout::Error => e
    puts "#{e.message}: Took too long!"
  end
end

try_with_timeout(2.0) do
  sleep 3.0
  puts "That was refreshing..."
end
