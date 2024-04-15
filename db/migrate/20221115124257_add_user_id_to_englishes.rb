class AddUserIdToEnglishes < ActiveRecord::Migration[6.1]
  def change
    add_column :english, :user_id, :integer
  end
end
