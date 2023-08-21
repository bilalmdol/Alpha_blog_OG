class UpdateExistingArticles < ActiveRecord::Migration[7.0]
  def change
    Articles.update_all(userId: User.first.id) # Assign articles to the first user as an example
  end
end
