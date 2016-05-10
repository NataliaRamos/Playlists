class AddColumnPlaylistsTimesAdded < ActiveRecord::Migration
  def change
    add_column :playlists, :times_added, :integer, :default => 1
  end
end
