class AddDescriptionFromProse < ActiveRecord::Migration
  def change
    add_column :proses, :description, :string
  end
end
