class Error::Validation < StandardError
  def initialize(message)
    @message = message
  end

  def to_json
    Oj.dump(@message)
  end
end
