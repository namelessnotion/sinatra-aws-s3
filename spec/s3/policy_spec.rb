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
      expect(policy.bucket).to       eq('my_bucket')
      expect(policy.key).to          eq('my_files/file.zip')
      expect(policy.content_type).to eq('application-x/zip')
      expect(policy.file_name).to    eq('file.zip')
      expect(policy.file_size).to    eq('165024')
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
      allow(policy).to receive(:expiration_date) {"2015-01-25T23:19:57.000Z"}
      #policy.stub(:expiration_date).and_return("2015-01-25T23:19:57.000Z")
      policy.sign
      expect(policy.signature).to eq("VpZbv7T3G2hgPpTIzBHKNQKIM5U=")
    end
  end
end
