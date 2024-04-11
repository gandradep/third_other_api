class RemoveDateFromShows < ActiveRecord::Migration[7.0]
  def change
    rename_column :shows, :time, :date_time
    remove_column :shows, :date, :date
  end
end
