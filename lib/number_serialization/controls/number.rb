module NumberSerialization
  module Controls
    module Number
      def self.example
        BigDecimal("11.1")
      end

      module Text
        def self.example
          "1.11e+01"
        end
      end

      module Infinity
        def self.example
          Positive.example
        end

        module Text
          def self.example
            Positive::Text.example
          end
        end

        module Positive
          def self.example
            bigdecimal
          end

          def self.bigdecimal
            BigDecimal("Infinity")
          end

          def self.float
            ::Float::INFINITY
          end

          module Text
            def self.example
              "Infinity"
            end
          end
        end

        module Negative
          def self.example
            bigdecimal
          end

          def self.bigdecimal
            BigDecimal("-Infinity")
          end

          def self.float
            -::Float::INFINITY
          end

          module Text
            def self.example
              "-Infinity"
            end
          end
        end
      end

      module NaN
        def self.example
          bigdecimal
        end

        def self.bigdecimal
          BigDecimal("NaN")
        end

        def self.float
          ::Float::NAN
        end

        module Text
          def self.example
            "NaN"
          end
        end
      end
    end
  end
end
