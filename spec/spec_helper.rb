# Load the Sinatra app
#require File.join(File.dirname(__FILE__), '..', 'lib', 'tahini', 'config')
#Tahini.config do |c|
#  c.aws_access_key_id = 'abc'
#  c.aws_secret_access_key = '123'
#  c.token = 'q1w2e3r4'
#  c.s3_bucket = 'tahini_s3_bucket'
#end
require File.join(File.dirname(__FILE__), '..', 'lib', 'sinatra_aws_s3')

SinatraAwsS3.config do |c|
  c.aws_access_key_id = '0FID494KLFG483NJHK342'
  c.aws_secret_access_key = 'iU33y3n27cSasO+4YHg6jIXeDz388BackCdos/Xy'
  c.token = 'q1w2e3r4'
end

# Load the testing libraries
require 'rspec'
require 'rack/test'

Rspec.configure do |config|
  config.mock_with :rspec
  config.include Rack::Test::Methods
  def app
    SinatraAwsS3::Server
  end
  app.set :environment, :test
end
