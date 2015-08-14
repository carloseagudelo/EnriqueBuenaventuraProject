class AddSpecialityToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :speciality, index: true, foreign_key: true
  end
end
