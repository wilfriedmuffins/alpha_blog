class AddUserIdToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user_id, :interger
  end
end
