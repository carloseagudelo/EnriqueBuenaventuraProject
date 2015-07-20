class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :credential, :string
    add_column :users, :subject, :string
    add_column :users, :semester, :string
    add_column :users, :interest, :string
    add_column :users, :level, :string
  end
end
