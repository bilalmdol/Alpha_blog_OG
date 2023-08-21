class AddforeignKeyToArticles < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :articles, :users, column: :userId
  end
end
