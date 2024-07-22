class RenameImgUrlToAvatarInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :img_url, :avatar
  end
end
