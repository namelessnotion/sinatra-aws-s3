require File.join(File.dirname(__FILE__), 'lib', 'sinatra_aws_s3')
SinatraAwsS3.config do |c|
  c.aws_access_key_id = ENV['AMAZON_ACCESS_KEY_ID']
  c.aws_secret_access_key = ENV['AMAZON_SECRET_ACCESS_KEY']
  c.token = 'for_testing_only'
end


run SinatraAwsS3::Server