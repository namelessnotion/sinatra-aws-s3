require 'spec_helper'

describe 'SinatraAwsS3::Server' do
  describe "GET signed_policy" do
    let(:mock_policy) { double("policy", :to_json => "policy in json", :sign => true) }
    before(:each) do
      allow(SinatraAwsS3::S3::Policy).to receive(:new) { mock_policy }
    end
    it "should create a policy" do
      expect(SinatraAwsS3::S3::Policy).to receive(:new).with(
        :bucket => 'my_bucket',
        :key => 'my_files/file.zip',
        :content_type => 'application-x/zip',
        :file_name => 'file.zip',
        :file_size => '165024'
      )
      get('/signed_policy.json',
        'bucket' => 'my_bucket',
        'key' => 'my_files/file.zip',
        'content_type' => 'application-x/zip',
        'file_name' => 'file.zip',
        'file_size' => '165024',
        'token' => 'q1w2e3r4')
    end

    it "should render policy to xml" do
      get('/signed_policy.json',
        'bucket' => 'my_bucket',
        'key' => 'my_files/file.zip',
        'content_type' => 'application-x/zip',
        'file_name' => 'file.zip',
        'file_size' => '165024',
        'token' => 'q1w2e3r4')
      expect(last_response.body).to eq("policy in json")
    end
  end
end
