class Artist < ActiveRecord::Base
  has_many :songs

  def self.artist_exists?(artist_id)
    where(id: artist_id).first == true
  end
end
