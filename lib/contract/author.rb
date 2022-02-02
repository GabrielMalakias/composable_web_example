class Contract::Author < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
  end
end
