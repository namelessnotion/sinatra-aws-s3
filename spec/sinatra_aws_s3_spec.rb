require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'SinatraAwsS3' do
  describe 'configuration' do
    it "should load the configuration" do
      expect(SinatraAwsS3.config.aws_access_key_id).to eq('0FID494KLFG483NJHK342')
      expect(SinatraAwsS3.config.aws_secret_access_key).to eq('iU33y3n27cSasO+4YHg6jIXeDz388BackCdos/Xy')
      expect(SinatraAwsS3.config.token).to eq('q1w2e3r4')
    end
  end
end
