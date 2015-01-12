module SinatraAwsS3
  module S3
    class Policy
      
      include Signature
      
      attr_accessor :bucket, :key, :content_type, :file_name, :file_size 
      attr_reader :policy, :expiration_date, :signature, :aws_access_key_id
      def initialize(options = {})
        @bucket = options[:bucket]
        @key = options[:key]
        @content_type = options[:content_type]
        @file_name = options[:file_name]
        @file_size = options[:file_size]
        @aws_access_key_id = SinatraAwsS3.config.aws_access_key_id
        @aws_secret_access_key = SinatraAwsS3.config.aws_secret_access_key
      end
      
      def sign
        validate
        set_policy
        #@signature = Base64.encode64(HMAC::SHA1.digest(@aws_secret_access_key, policy)).gsub(/\n|\r/, '')
        #@signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), @aws_secret_access_key, policy)).gsub(/\n| |\r/, '')
        @signature = b64_hmac_sha1(@aws_secret_access_key, policy)
      end
      
      def set_policy
        set_expiration_date
        #{'Content-Type': '#{content_type}'},
        @policy = Base64.encode64(
"{
    'expiration': '#{self.expiration_date}',
    'conditions': [
        {'bucket': '#{bucket}'},
        {'key': '#{key}'},
        {'acl': 'private'},
        ['eq', '$success_action_status', '201']
    ]
}").gsub(/\n|\r/, '')
      end
      
      def is_valid?
        @bucket && @key && @content_type && @file_name && @file_size && @aws_access_key_id && @aws_secret_access_key
      end
      
      def validate
        raise "bucket missing" if !@bucket
        raise "key missing" if !@key
        #raise "conent_type missing" if !@content_type
        raise "file_name" if !@file_name
        raise "file_size" if !@file_size
        raise "aws_access_key_id" if !@aws_access_key_id
        raise "aws_secret_access_key" if !@aws_secret_access_key
      end
      
      def set_expiration_date
        @expiration_date = (Time.now.utc + 3600).strftime('%Y-%m-%dT%H:%M:%S.000Z')
      end
      
      def to_json
        { :expirationdate => self.expiration_date,
          :policy => @policy,
          :bucket => @bucket,
          :signature => @signature,
          :accesskeyid => @aws_access_key_id,
          :acl => 'private',
          :https => 'false',
          :key => @key
        }.to_json
      end
    end
  end
end
