class RemoveColumnsFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :empid, :string
    remove_column :articles, :userId, :string
  end
end
