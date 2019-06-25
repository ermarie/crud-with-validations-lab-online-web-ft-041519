class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validate :correct_release
    validate :same_title

    def correct_release   
        if released
            if release_year == nil
                errors[:release_year] << 'Must have release year!'
            elsif release_year > Date.today.year
                errors[:release_year] << 'Release year may not be in the future!'
            end

        end
    end

    def same_title
        song = Song.find_by(title: title)
        if song
            if song.artist_name == artist_name
                if song.release_year == release_year 
                    errors[:artist_name] << "Artist cannot release same song within the same year"
                end
            end
        end
    end

end
