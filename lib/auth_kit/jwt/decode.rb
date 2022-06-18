# frozen_string_literal: true

module AuthKit
  module JWT
    class Decode
      require 'base64'
      require 'json'

      def initialize(jwt)
        @token = jwt
        @segments = jwt.split('.')
        @signature = @segments[2]
        @key = AuthKit.secret_key
        @algorithm = AuthKit.hash_algorithm
      end

      def decode_payload
        validate_segment_count!
        verify!
        raise(StandardError, 'Invalid payload') unless payload

        payload
      end

      private

      def validate_segment_count!
        return if segment_length == 3

        raise(StandardError, 'Not enough or too many segments')
      end

      def segment_length
        @segments.count
      end

      def payload
        (parse_and_decode(@segments[1])).transform_keys(&:to_sym)
      end

      def unsigned_token
        @segments.first(2).join('.')
      end

      def decode_signature
        @signature ||= parse_and_decode @segments[2]
      end

      def verify!
        return if OpenSSL::HMAC.hexdigest(@algorithm.sub('HS', 'sha'), @key, unsigned_token) == @signature

        raise(StandardError, 'Invalid signature')
      end

      def parse_and_decode(segment)
        JSON.parse(Base64.decode64(segment))
      end
    end
  end
end
