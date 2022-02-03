# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:authors) do
      primary_key :id
      String :name, null: false
    end
  end

  down do
    drop_table(:authors)
  end
end
