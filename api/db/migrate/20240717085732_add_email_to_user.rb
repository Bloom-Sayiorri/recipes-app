class AddEmailToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :email, :users, :string
  end
end
