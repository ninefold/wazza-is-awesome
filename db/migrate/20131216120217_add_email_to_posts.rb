class AddEmailToPosts < ActiveRecord::Migration
  def change
    raise 'this migration will fail!'
    add_column :posts, :email, :string
  end
end
