require "EventbriteClient/version"
require 'rest_client'
require 'json'

module EventbriteClient
  class API
    # constructor
    def initialize( auth_tokens )
      @base_url = "https://www.eventbrite.com"
      @auth = {app_key: "IT7XL4RVM2CGSGTVLX"}
      @data_type = "json"

      if auth_tokens != nil and auth_tokens.is_a? Hash
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

  def event_search (params)
    querystring = @auth.merge( params.is_a?(Hash) ? params : {} )
    url = @base_url + "/#{@data_type}/event_search"
    data = RestClient.get url, {:params => querystring}
    result = JSON.parse(data)

    # if the hash has 'Error' as a key, we raise an error
    if result.has_key? 'Error'
              raise "web service error"
    end
    return result
  end

  end
end
