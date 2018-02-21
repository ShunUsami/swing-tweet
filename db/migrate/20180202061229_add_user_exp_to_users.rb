class AddUserExpToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :user_exp, :integer
  end
end
