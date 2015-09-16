class AddDescriptionToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :description, :string
  end
end
