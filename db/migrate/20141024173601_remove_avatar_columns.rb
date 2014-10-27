class RemoveAvatarColumns < ActiveRecord::Migration
  def change
    remove_columns :users, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  end
end
