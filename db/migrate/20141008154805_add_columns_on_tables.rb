class AddColumnsOnTables < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string, :default => ''
    add_column :users, :last_name, :string, :default => ''
    add_column :users, :phone_number, :string, :default => ''
    add_column :users, :address, :string, :default => ''
    add_column :users, :latitude, :float, :default => ''
    add_column :users, :longitude, :float, :default => ''
    add_column :users, :gender, :boolean, :default => false

    add_column :trainers, :first_name, :string, :default => ''
    add_column :trainers, :last_name, :string, :default => ''
    add_column :trainers, :phone_number, :string, :default => ''
    add_column :trainers, :address, :string, :default => ''
    add_column :trainers, :latitude, :float, :default => ''
    add_column :trainers, :longitude, :float, :default => ''
    add_column :trainers, :gender, :boolean, :default => false
    add_column :trainers, :is_trainer, :boolean, :default => true

  end

  def down
    remove_column :users, :first_name, :string, :default => ''
    remove_column :users, :last_name, :string, :default => ''
    remove_column :users, :phone_number, :string, :default => ''
    remove_column :users, :address, :string, :default => ''
    remove_column :users, :latitude, :float, :default => ''
    remove_column :users, :longitude, :float, :default => ''
    remove_column :users, :gender, :boolean, :default => false

    remove_column :trainers, :first_name, :string, :default => ''
    remove_column :trainers, :last_name, :string, :default => ''
    remove_column :trainers, :phone_number, :string, :default => ''
    remove_column :trainers, :address, :string, :default => ''
    remove_column :trainers, :latitude, :float, :default => ''
    remove_column :trainers, :longitude, :float, :default => ''
    remove_column :trainers, :gender, :boolean, :default => false
    remove_column :trainers, :is_trainer, :boolean, :default => true
  end
end
