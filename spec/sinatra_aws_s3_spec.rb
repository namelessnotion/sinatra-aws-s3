require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'SinatraAwsS3' do
  describe 'configuration' do
    it "should load the configuration" do
      SinatraAwsS3.config.aws_access_key_id.should == '0FID494KLFG483NJHK342'
      SinatraAwsS3.config.aws_secret_access_key.should == 'iU33y3n27cSasO+4YHg6jIXeDz388BackCdos/Xy'
      SinatraAwsS3.config.token.should == 'q1w2e3r4'
    end
  end
end