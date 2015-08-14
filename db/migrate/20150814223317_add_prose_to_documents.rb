class AddProseToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :prose, index: true, foreign_key: true
  end
end
