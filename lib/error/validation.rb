class Error::Validation < Error::Base
  def initialize(message)
    @message = message
  end

  def to_json
    Oj.dump(@message)
  end
end
