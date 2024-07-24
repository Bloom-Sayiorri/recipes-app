class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.text :description
      t.string :country_of_origin
      t.integer :serving
      t.text :ingredients
      t.text :instructions
      t.datetime :date_time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
