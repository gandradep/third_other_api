class RemovePictureFromShows < ActiveRecord::Migration[7.0]
  def change
    remove_column :shows, :picture, :string
  end
end
