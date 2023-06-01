# frozen_string_literal: true

module RealFevr
  class Api
    class << self
      URL = 'https://c8e021d8-5251-4e83-827a-64176b4737c5.mock.pstmn.io/players'

      # Exports a delivery receipt to ADaM
      #
      # @example Make a valid request
      #   RealFevr::Api.import
      #
      # @return json with teams and players infos
      def import
        RealFevr::ConsumeData.new(parsed_body)
      end

      private

      def parsed_body
        JSON.parse(result)['data']
      end

      def result
        connection.body
      end

      def connection
        RestClient.get(URL, headers)
      end

      def headers
        {
          Accept: 'application/json',
          'Content-type': 'application/json'
        }
      end
    end
  end
end
