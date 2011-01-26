module SinatraAwsS3
  class Server < Sinatra::Base
    register Sinatra::Warden

    use Warden::Manager do |manager|
      manager.default_strategies :token
      manager.failure_app = Server
    end

    post '/unauthenticated/?' do
      status 401
      warden.custom_failure! if warden.config.failure_app == self.class
      env['x-rack.flash'][:error] = options.auth_error_message if defined?(Rack::Flash)
      "access denied"
    end
    
    get '/signed_policy.json' do
      authenticate
      content_type :json
      policy = S3::Policy.new( :bucket => params[:bucket], :key => params[:key], :content_type => params[:content_type], :file_name => params[:file_name], :file_size => params[:file_size])
      policy.sign
      policy.to_json
    end
    
  end
end