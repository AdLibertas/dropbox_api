module DropboxApiV2
  class ApiResult
    def initialize(response_data)
      @response_data = response_data
    end

    def error_summary
      @response_data["error_summary"]
    end

    def error
      @response_data["error"]
    end

    def has_error?
      !error_summary.nil?
    end

    def build_metadata(result_type)
      Metadata::Factory.build @response_data, result_type
    end

    def build_error(error_type)
      error_type.build(error, error_summary)
    end
  end
end
