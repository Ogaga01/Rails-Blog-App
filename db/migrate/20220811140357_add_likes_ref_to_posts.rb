class AddLikesRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :likescounter, null: false, foreign_key: true
  end
end
