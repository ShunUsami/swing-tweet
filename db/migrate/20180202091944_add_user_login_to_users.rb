class AddUserLoginToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :login_count, :integer
  end
end
