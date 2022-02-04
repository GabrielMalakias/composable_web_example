module Validate
  module_function

  def self.[](model)
    proc do |params|
      result = model.validate(params)

      raise Error::Validation.new(result.errors.to_h) if result.failure?

      result.to_h
    end
  end
end
