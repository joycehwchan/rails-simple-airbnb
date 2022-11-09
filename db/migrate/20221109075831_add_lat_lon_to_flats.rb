class AddLatLonToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :longitude, :string
    add_column :flats, :latitude, :string
  end
end
