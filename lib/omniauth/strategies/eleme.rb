require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Eleme < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "eleme"

      option :authorize_params, {scope: "all"}
      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site => Rails.env.production? ? "https://open-api.shop.ele.me" : "https://open-api-sandbox.shop.ele.me", 
        :authorize_url => "/authorize",
        :token_method => :post,
        # :token_url => "http://localhost:3002/backend/shops/diandanbao/branches",
        :token_url => "/token",
        :auth_scheme => "basic_auth"
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{}

      info do
        {
          token_type: access_token["token_type"]
        }
      end

      extra do
        {}
      end

      
      protected
      def build_access_token
        Rails.logger.info("#{client.id}:#{client.secret}")
        params = {
          'client_id' => client.id,
          'code' => request.params['code'],
          'grant_type' => 'authorization_code',
          'redirect_uri' => callback_url
          }.merge(token_params.to_hash(symbolize_keys: true))
        response = client.get_token(params, deep_symbolize(options.auth_token_params))
        response
      end
    end
  end
end