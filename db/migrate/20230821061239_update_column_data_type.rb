class UpdateColumnDataType < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
