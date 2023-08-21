class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :title, :string, presence: true, length: { minimum: 5, maximum: 25 }
    add_column :articles, :desc, :text
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
