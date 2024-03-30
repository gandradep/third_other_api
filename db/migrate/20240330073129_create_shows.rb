class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :description
      t.string :picture
      t.string :url_flyer
      t.string :show_recording_link
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
