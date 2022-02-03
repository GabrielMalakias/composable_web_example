# frozen_string_literal: true

module Contract
  class Author < Dry::Validation::Contract
    params do
      optional(:id).filled(:integer)
      required(:name).filled(:string)
    end

    def self.validate(params)
      new.call(params)
    end
  end
end
