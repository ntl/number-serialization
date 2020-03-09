module NumberSerialization
  module Read
    def self.call(text)
      unless text.instance_of?(String)
        error_message = "Must supply a String, not a #{text.class}"
        logger.error { error_message }
        raise TypeError, error_message
      end

      begin
        BigDecimal(text)
      rescue ArgumentError
        error_message = "Malformed number string #{text.inspect}"
        logger.error { error_message }
        raise Error, error_message
      end
    end

    def self.logger
      @logger ||= Log.get(self)
    end

    Error = Class.new(RuntimeError)
  end
end
