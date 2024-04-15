class ChangeEnglishToEnglishes < ActiveRecord::Migration[6.1]
  def change
    rename_table :english, :englishes
  end
end
