class ChangeShowsTimeToTimestamp < ActiveRecord::Migration[7.0]
  def change
    change_table :shows do |t|
      t.remove :date_time
      t.timestamp :event_date
    end
  end
end
