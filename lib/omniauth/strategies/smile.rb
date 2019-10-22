module OmniAuth
  module Strategies
    class Smile < OmniAuth::Strategies::OAuth2
      option :name, "smile"

      option :client_options,
             site: ENV.fetch('SMILE_AUTH_URL', 'https://connect.smile.io'),
             authorize_url: '/oauth2/authorize',
             token_url: '/oauth2/token',
             scope: 'customer:read',
             callback_path: '/integrations/smile/oauth_callback'

      option :auth_token_params, {
        grant_type: 'authorization_code',
        scope: 'customer:read'
      }

      credentials do
        {
          code: request.params[:code],
          scope: 'customer:read',
        }
      end

      ##
      # @return [String] Base callback URI without the params since adding the params in (which is default) makes the Smile API return a 4xx error
      def callback_base_url
        full_host + script_name + callback_path
      end

      def token_params
        super.merge(
          headers: {
            'Authorization' => "Basic #{Base64.strict_encode64("#{options.client_id}:#{options.client_secret}")}"
          },
          redirect_uri: callback_base_url
        )
      end

    end
  end
end

