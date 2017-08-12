class CreateAdverts < ActiveRecord::Migration[5.1]
  def change
    create_table :adverts do |t|
      t.stringdescription :title
      t.string :city
      t.string :street
      t.string :phone

      t.timestamps
    end
  end
end
