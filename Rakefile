require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new :spec

desc 'Run Overpromotion console'
task :console do
  require 'irb'
  require_relative 'lib/overpromotion'
  include Overpromotion
  ARGV.clear
  IRB.start
end
