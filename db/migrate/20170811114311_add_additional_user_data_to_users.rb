class AddAdditionalUserDataToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :house_number, :string
    add_column :users, :flat_number, :string
    add_column :users, :post_code, :string
    add_column :users, :is_nanny, :boolean, default: false

  end
end
