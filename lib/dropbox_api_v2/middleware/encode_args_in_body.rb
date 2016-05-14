module DropboxApiV2::MiddleWare
  # If the body happens to be a `Hash`, we're encoding it with JSON so it can
  # be sent.
  class EncodeArgsInBody < Faraday::Middleware
    def call(env)
      if env[:body].is_a? Hash
        env[:request_headers]['content-type'] = 'application/json'
        env[:body] = encode env[:body]
      end

      @app.call env
    end

    def encode(payload)
      JSON.dump payload
    end
  end

  Faraday::Request.register_middleware :encode_args_in_body => EncodeArgsInBody
end
