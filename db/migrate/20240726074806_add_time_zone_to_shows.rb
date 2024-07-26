class AddTimeZoneToShows < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :time_zone, :string
  end
end
