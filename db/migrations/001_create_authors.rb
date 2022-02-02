Sequel.migration do
  def up
    create_table :authors do
      primary_key :id
      String :name
    end
  end

  def down
    drop_table :authors
  end
end
