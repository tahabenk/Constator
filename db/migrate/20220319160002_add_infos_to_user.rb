class AddInfosToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :family_name, :string
    add_column :users, :address, :string
    add_column :users, :identity_number, :string
    add_column :users, :type_of_id_document, :string
    add_column :users, :birthdate, :date
    add_column :users, :phone_number, :string
  end
end
