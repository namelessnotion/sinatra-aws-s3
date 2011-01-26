require 'spec_helper'

describe "SinatraAwsS3::S3::Policy" do
  describe "building" do
    it "should build from intiailizaton" do
      policy = SinatraAwsS3::S3::Policy.new(
        :bucket => 'my_bucket', 
        :key => 'my_files/file.zip', 
        :content_type => 'application-x/zip', 
        :file_name => 'file.zip', 
        :file_size => '165024')
      policy.bucket.should == 'my_bucket'
      policy.key.should == 'my_files/file.zip'
      policy.content_type == 'application-x/zip'
      policy.file_name.should == 'file.zip'
      policy.file_size.should == '165024'
    end
  end

  describe "signing" do
    
    it "should generate a hmac-sha1 signature" do
      policy = SinatraAwsS3::S3::Policy.new(
        :bucket => 'user-uploads', 
        :key => 'u19430/whitetail.jpg', 
        :content_type => 'image/jpeg', 
        :file_name => 'whitetail.jpg', 
        :file_size => '165024')
      policy.stub(:expiration_date).and_return("2011-01-25T23:19:57.000Z")
      policy.sign
      policy.signature.should == "KYeWPJGmy58HEhMOaws5U2T/nu8="
    end
  end
end
