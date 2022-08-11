class AddUsersRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :authorid, null: false, foreign_key: true
  end
end
