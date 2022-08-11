class AddUsersRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :authorid, null: false, foreign_key: true
  end
end
