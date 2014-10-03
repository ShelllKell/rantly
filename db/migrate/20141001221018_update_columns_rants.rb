class UpdateColumnsRants < ActiveRecord::Migration
  def change
    add_column(:rants, :created_at, :datetime)
    remove_column :rants, :create_at
  end
end


