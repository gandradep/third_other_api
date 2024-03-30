class CreateArtistPerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :artist_performances do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :performance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
