class AddStateToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :stata, :boolean, :default => false
    add_column :articles, :statepublic, :boolean, :default => false
  end
end
