class Createrants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :topic
      t.string :rant
      t.integer :user_id
    end
  end
end
