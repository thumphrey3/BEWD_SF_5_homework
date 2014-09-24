class AddArtistToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :artist, :string
  end
end
