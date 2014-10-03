class CreateRants < ActiveRecord::Migration
  def change
    change_table :rants do |t|
      t.datetime :create_at
      t.datetime :updated_at
    end
  end
end
