module Shortener
  module Links
    class Short
      attr_reader :long_url

      def initialize(long_url)
        @long_url = long_url
      end

      def execute
        long_url
      end
    end
  end
end
