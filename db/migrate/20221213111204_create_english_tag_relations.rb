class CreateEnglishTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :english_tag_relations do |t|
      t.references :english, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
