class AddPriceToAdverts < ActiveRecord::Migration[5.1]
  def change
    add_column :adverts, :price, :float
  end
end
