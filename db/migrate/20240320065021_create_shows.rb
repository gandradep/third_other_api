class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :picture
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
