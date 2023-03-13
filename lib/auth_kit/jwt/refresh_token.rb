module AuthKit
  module JWT
    class RefreshToken
      def expiration_time
        (DateTime.now + AuthKit.refresh_token_expiration_time).to_time.to_i
      end
    end
  end
end
