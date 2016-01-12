class AddStateToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :stata, :boolean, :default => true
    add_column :articles, :statepublic, :boolean, :default => false
  end
end
