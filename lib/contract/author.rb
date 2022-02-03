# frozen_string_literal: true

module Contract
  class Author < Dry::Validation::Contract
    params do
      required(:name).filled(:string)
    end
  end
end
