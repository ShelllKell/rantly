class User < ActiveRecord::Migration

    add_column :users, :disabled, :boolean, default: false
    add_column :users, :login, :string
    add_column :users, :token, :string

end
