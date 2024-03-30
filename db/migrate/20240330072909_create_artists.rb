class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :image_url
      t.text :bio
      t.string :music_links, array: true, default: []

      t.timestamps
    end
  end
end
