module DropboxApiV2::Metadata
  class Field
    def initialize(type, options = [])
      @type = type
      @options = options
    end

    def cast(object)
      if object.nil? && @options.include?(:optional)
        nil
      else
        force_cast object
      end
    end

    def force_cast(object)
      if @type == String
        object.to_s
      elsif @type == Time
        Time.new(object)
      elsif @type == Integer
        object.to_i
      elsif @type == Symbol
        object[".tag"].to_sym
      elsif @type == :boolean
        object.to_s == "true"
      elsif @type.ancestors.include? DropboxApiV2::Metadata::Base
        @type.new(object)
      else
        raise NotImplementedError, "Can't cast `#{type}`"
      end
    end
  end
end
