source 'https://rubygems.org'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra', '~> 1.0'
gem 'sinatra-contrib'
gem 'thin'
gem 'pry'

gem 'activesupport', "~>4.2"
gem 'activerecord', "~>4.2"

gem 'bcrypt-ruby'
gem 'httparty'

gem 'shotgun'
gem 'kramdown'

group :development, :test do
  gem 'faker'
  gem 'rspec'
  gem 'rake', '< 11.0'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

end
