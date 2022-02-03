class Handler::Common
  class << self
    def read_json_from_request(request)
      Oj.load(request['rack.input'].read)
    end

    def read_id_from_request(request)
      request['PATH_INFO'].split('/').last.to_i
    end

    def build_ok_json_response(json)
      [200, { 'Content-Type' => 'application/json' }, [json]]
    end

    def build_failed_json_response(json)
      [422, { 'Content-Type' => 'application/json' }, [json]]
    end
  end
end
