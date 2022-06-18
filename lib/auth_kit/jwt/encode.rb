# frozen_string_literal: true

module AuthKit
  module JWT
    class Encode
      require 'base64'
      require 'json'

      def initialize(payload)
        @payload = payload
        @key = AuthKit.secret_key
        @algorithm = AuthKit.hash_algorithm
      end

      def segments
        @segments ||= combine(encode_header, encode_payload, signature)
      end

      private

      def encode_header
        encode64({ "alg": @algorithm, "typ": 'JWT' })
      end

      def encode_payload
        AuthKit::ClaimsValidator.new(@payload).validate! if @payload.is_a?(Hash)
        encode64(@payload)
      end

      def unsigned_token
        combine(encode_header, encode_payload)
      end

      def signature
        OpenSSL::HMAC.hexdigest(@algorithm.sub('HS', 'sha'), @key, unsigned_token)
      end

      def encode64(data)
        Base64.encode64(JSON.generate(data)).gsub(/[\n=]/, '')
      end

      def combine(*parts)
        parts.join('.')
      end
    end
  end
end
