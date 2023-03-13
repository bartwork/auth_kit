module AuthKit
  module JWT
    class AccessToken
      def expiration_time
        (DateTime.now + AuthKit.access_token_expiration_time).to_time.to_i
      end
    end
  end
end
