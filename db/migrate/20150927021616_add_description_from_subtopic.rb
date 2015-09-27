class AddDescriptionFromSubtopic < ActiveRecord::Migration
  def change
    add_column :subtopics, :description, :string
  end
end
