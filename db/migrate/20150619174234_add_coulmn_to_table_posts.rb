class AddCoulmnToTablePosts < ActiveRecord::Migration
  def change
    add_column :posts, :auther_id, :integer
  end
end
