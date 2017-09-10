def tag(tag)
  "<#{tag}>#{yield}</#{tag}>"
end

puts tag(:h1) { "Breaking News!" }
puts tag(:h2) { "Massive Ruby Discovered" }


def with_debugging
  puts "\nstart"
  result = yield
  puts "end with: #{result}"
end

with_debugging { magic_number = (23 - Time.now.hour) * Math::PI }


def with_expectation(expected)
  puts "\nrunning test..."
  result = yield
  puts (expected == result) ?  "Passed!" :  "Failed. Expected '#{expected}', but got '#{result}'"
end

with_expectation(4) { 2 + 2 }
with_expectation(5) { 2 + 2 }


puts "\nBenchmark:"
require 'benchmark'

elapsed_time = Benchmark.realtime do
  # run some code
  sleep(1)
end
puts "It took #{elapsed_time} seconds"


puts "\ntime_it:"
def time_it(desc)
  start_time = Time.now
  yield
  elapsed_time = Time.now - start_time
  puts "#{desc} took #{elapsed_time} seconds"
end

time_it("Rush Code") do
  sleep(1)
end
