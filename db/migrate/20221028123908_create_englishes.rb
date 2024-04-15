class CreateEnglishes < ActiveRecord::Migration[6.1]
  def change
    create_table :english do |t|
      t.string :topic
      t.text :body
      t.string :image
      t.string :youtube_url

      t.timestamps
    end
  end
end
