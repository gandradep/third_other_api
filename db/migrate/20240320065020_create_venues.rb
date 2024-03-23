class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :url
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
