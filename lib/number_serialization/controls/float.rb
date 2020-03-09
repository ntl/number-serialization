module NumberSerialization
  module Controls
    module Float
      def self.example
        11.1
      end

      def self.text
        '1.11e+01'
      end

      module Maximum
        def self.raw
          ::Float::MAX
        end

        def self.text
          "1.797693134862316e+308"
        end
      end

      module Minimum
        def self.raw
          (2.0 ** -1022)
        end

        def self.text
          "2.225073858507201e-308"
        end
      end
    end
  end
end
