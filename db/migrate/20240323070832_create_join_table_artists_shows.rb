class CreateJoinTableArtistsShows < ActiveRecord::Migration[7.0]
  def change
    create_join_table :artists, :shows do |t|
    end
  end
end
