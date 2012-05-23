require "EventbriteClient/version"
require 'rest_client'

module EventbriteClient
  class API
    base_url 'https:/www.eventbrite.com'
    @auth = {}
    @data_type = 'json'
     
    # constructor
    def initialize( auth_tokens )
      if auth_tokens.is_a? Hash
        if auth_tokens.include? :app_key
        #use api_key OR api_key + user_key OR api_key+email+pass
        if auth_tokens.include? :user_key
          # read/write access on the user account associated with :user_key
          @auth = {app_key: auth_tokens[:app_key], user_key: auth_tokens[:user_key]}
        else
          # read-only access to public data
          @auth = {app_key: auth_tokens[:app_key]}
        end 
	end                                                                                        end
    end

  def method_request( method, params )
    #merge auth params into our request querystring
    querystring = @auth.merge( params.is_a?(Hash) ? params : {} )
    resp = RestClient.get "#{base_url}/#{@data_type}/#{method.to_s}", {:params => {querystring}}
    
    
    return resp
  end

  def method_missing(method, *args, &block)
    self.method_request(method, args[0])
  end

  end
end
