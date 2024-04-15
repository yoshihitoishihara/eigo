class CreateVideoCheckRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :video_check_relations do |t|
      t.references :video, null: false, foreign_key: true
      t.references :check, null: false, foreign_key: true

      t.timestamps
    end
  end
end
