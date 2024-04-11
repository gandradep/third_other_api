class RenameUrlColumnInVenues < ActiveRecord::Migration[7.0]
  def change
    rename_column :venues, :url, :url_location
  end
end
