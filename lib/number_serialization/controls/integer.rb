module NumberSerialization
  module Controls
    module Integer
      def self.example
        11
      end

      def self.text
        '1.1e+01'
      end

      module Maximum
        def self.raw
          2 ** 53 - 1
        end

        def self.text
          '9.007199254740991e+15'
        end
      end

      module Minimum
        def self.raw
          -2 ** 53
        end

        def self.text
          '-9.007199254740992e+15'
        end
      end
    end
  end
end
