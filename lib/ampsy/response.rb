module Ampsy
  class Response
    def initialize(response, success_status)
      @response = response
      @success_status = success_status
    end

    def success?
      @response.code == @success_status
    end

    def error?
      !success?
    end

    def error_message
      data['error']
    end

    def data
      @response.parsed_response
    end
  end
end
