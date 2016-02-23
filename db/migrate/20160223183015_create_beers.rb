class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :style
      t.float :alc
      t.string :color
      t.decimal :price
      t.integer :rating

      t.timestamps null: false
    end
  end
end
