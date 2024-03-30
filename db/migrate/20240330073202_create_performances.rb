class CreatePerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :performances do |t|
      t.string :description
      t.string :recording_link
      t.string :url_picture_show
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
