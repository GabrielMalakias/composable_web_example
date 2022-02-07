module Validate
  module_function

  def self.[](contract)
    proc do |params|
      result = contract.validate(params)

      raise Error::Validation.new(result.errors.to_h) if result.failure?

      result.to_h
    end
  end
end
