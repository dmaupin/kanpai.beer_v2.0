class AddImgToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :img, :string
  end
end
