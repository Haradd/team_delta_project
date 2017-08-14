class EditDescriptionType < ActiveRecord::Migration[5.1]
  def self.up
    change_table :adverts do |t|
      t.change :description, :text
    end
  end
  def self.down
    change_table :adverts do |t|
      t.change :description, :string
    end
  end
end
