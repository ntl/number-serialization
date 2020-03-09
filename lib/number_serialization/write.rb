module NumberSerialization
  module Write
    def self.call(number, precision: nil, rounding_mode: nil)
      logger.trace { "Serializing number (#{LogText.attributes(number, precision, rounding_mode)})" }

      precision ||= Defaults.precision
      rounding_mode ||= Defaults.rounding_mode

      unless number.is_a?(Numeric)
        error_message = "Must supply a numeric value (#{LogText.attributes(number, precision, rounding_mode)})"
        logger.error { error_message }
        raise TypeError, error_message
      end

      if number.instance_of?(Float)
        precision = [precision, Float::DIG + 1].min
      end

      if number == BigDecimal::INFINITY
        text = "Infinity"
      elsif number == -BigDecimal::INFINITY
        text = "-Infinity"
      elsif number.respond_to?(:nan?) && number.nan?
        text = "NaN"
      else
        original_number = number

        number = BigDecimal(number, precision)

        BigDecimal.save_rounding_mode do
          BigDecimal.mode(BigDecimal::ROUND_MODE, rounding_mode)

          number = number.mult(1, precision)
        end

        sign, number, _, exponent = number.split

        sign = (sign == -1 ? '-' : '')

        if number.length == 1
          integer_part = 0
        else
          integer_part = number.slice!(0, 1)

          exponent -= 1
        end

        decimal_part = number

        text = "%s%s.%se%0+03d" % [sign, integer_part, decimal_part, exponent]
      end

      logger.info { "Number serialized (#{LogText.attributes(original_number, precision, rounding_mode)}, Text: #{text.inspect})" }

      text
    end

    def self.logger
      @logger ||= Log.get(self)
    end

    module LogText
      def self.attributes(number, precision, rounding_mode)
        precision ||= '(default)'

        if rounding_mode.nil?
          rounding_mode_text = '(default)'
        else
          rounding_mode_text = rounding_mode(rounding_mode)
        end

        %[Number: #{number.inspect}, Precision: #{precision}, Rounding Mode: #{rounding_mode_text}]
      end

      def self.rounding_mode(rounding_mode)
        BigDecimal.constants.each do |const_name|
          value = BigDecimal.const_get(const_name)

          return "BigDecimal::#{const_name}" if value == rounding_mode
        end

        '(unknown)'
      end
    end

    Error = Class.new(RuntimeError)
  end
end
