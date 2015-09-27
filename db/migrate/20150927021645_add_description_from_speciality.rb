class AddDescriptionFromSpeciality < ActiveRecord::Migration
  def change
    add_column :specialities, :description, :string
  end
end
