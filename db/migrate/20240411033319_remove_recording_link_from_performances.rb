class RemoveRecordingLinkFromPerformances < ActiveRecord::Migration[7.0]
  def change
    remove_column :performances, :recording_link, :string
  end
end
