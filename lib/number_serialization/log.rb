module NumberSerialization
  class Log < ::Log
    def tag!(tags)
      tags << :number_serialization
      tags << :library
      tags << :verbose
    end
  end
end
