require "rubygems"
require "bundler/setup"

require "warden"
require "sinatra"
#require 'sinatra/warden/helper'
require File.join(File.dirname(__FILE__),'sinatra', 'warden', 'helper')
require File.join(File.dirname(__FILE__),'sinatra_aws_s3', 'config')

#require 'sinatra_aws_s3/config'
require 'base64'
require 'ruby_hmac'
require 'hmac-sha1'
require 'json/pure'
require 'aws/s3'
#require 'sinatra_aws_s3/s3/policy'
#require 'sinatra_aws_s3/server'
require File.join(File.dirname(__FILE__),'sinatra_aws_s3', 's3', 'signature')
require File.join(File.dirname(__FILE__),'sinatra_aws_s3', 's3', 'policy')
require File.join(File.dirname(__FILE__),'sinatra_aws_s3', 'server')



module SinatraAwsS3

end
