class AddAdvertToLocations < ActiveRecord::Migration[5.1]
  def change
  	add_reference :locations, :advert, foreign_key: true
  end
end
