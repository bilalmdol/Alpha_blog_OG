class Update < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :user_id, :userId
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
