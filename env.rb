# Local override
dotenv = File.expand_path("../.env_overrides.rb", __FILE__)
require dotenv if File.exist?(dotenv)

ENV["RAILS_ENV"] ||= "development"

ENV["DATABASE_ADAPTER"] ||= "mysql"
ENV["DATABASE_NAME"] ||= "ecos_#{ENV["RAILS_ENV"]}"
ENV["DATABASE_USER"] ||= "root"
ENV["DATABASE_PASSWORD"] ||= ""
ENV["DATABASE_ENCODING"] ||= "utf8"
ENV["DATABASE_HOST"] ||= "localhost"
ENV["DATABASE_POOL"] ||= "5"

ENV["DEVELOPMENT_PORT"] ||= "3000"
