class UpdateStringLength < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :content, :string, :limit => 6
  end
end
