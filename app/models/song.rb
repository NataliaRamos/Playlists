class Song < ActiveRecord::Base
  has_many :playlists
  has_many :users, :through => :playlists

  validates :title, :artist, presence: true, length: { minimum: 2 }

  before_save do
    self.times_added ||= 0
    self.times_added += 1
    self
  end
end
