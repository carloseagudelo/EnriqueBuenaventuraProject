class AddNumberToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :place, :string
    add_column :documents, :status, :string
    add_column :documents, :number, :int
  end
end
