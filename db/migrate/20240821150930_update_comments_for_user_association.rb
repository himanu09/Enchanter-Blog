class UpdateCommentsForUserAssociation < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :commenter, :string
    add_reference :comments, :user, null: false, foreign_key: true
  end
end
