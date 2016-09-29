class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :title_unique?

  validate :check_release_year?

  def check_release_year?
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "Must add release year.")
    end
    if self.release_year && self.release_year > Time.now.year
      errors.add(:release_year, "Can't be in the future.")
    end
  end



  def title_unique?
    songs = Song.all
    songs.each do |song|
      if song.title == self.title && song.artist_name == self.artist_name && song.release_year == self.release_year
        errors.add(:title, "Artist can't release same song in one year.")
      end
    end
  end

end
