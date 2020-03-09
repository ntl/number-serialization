module NumberSerialization
  module Defaults
    def self.precision(env: nil)
      env ||= {}

      precision_text = env.fetch('NUMBER_SERIALIZATION_PRECISION', 17)

      precision = precision_text.to_i

      precision
    end

    def self.rounding_mode
      BigDecimal::ROUND_HALF_EVEN
    end
  end
end
