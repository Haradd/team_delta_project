class AddAdvertTypeToAdverts < ActiveRecord::Migration[5.1]
  def change
    add_column :adverts, :advert_type, :string
  end
end
