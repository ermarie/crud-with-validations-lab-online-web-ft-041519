class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    

    if :released == true
        validates :release_year, presence: true
        validates :release_year, length: {maximum: Date.today.year}
    end

end
