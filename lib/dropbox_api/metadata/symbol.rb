module DropboxApi::Metadata
  class Symbol < DropboxApi::Metadata::Base
    def self.new(data)
      case data
      when ::Symbol
        validate(data)
      when Hash
        new(data[".tag"].to_sym)
      when String
        new(data.to_sym)
      else
        raise ArgumentError, "Invalid object for #{name}: #{data.inspect}."
      end
    end

    def self.validate(value)
      if valid_values.include? value
        value
      else
        raise ArgumentError, "invalid value for #{name}: #{value.inspect}"
      end
    end
  end
end
