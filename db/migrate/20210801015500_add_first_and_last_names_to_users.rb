class AddFirstAndLastNamesToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    User.connection.execute <<~SQL
      UPDATE users
      SET first_name = split_part(name, ' ', 1), last_name = split_part(name, ' ', 2)
    SQL

    remove_column :users, :name
  end

  def down
    add_column :users, :name, :string

    User.connection.execute <<~SQL
      UPDATE users
      SET name = first_name || ' ' || last_name
    SQL

    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
