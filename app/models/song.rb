class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :release_year, presence: true, if: :released
    validate :release_year_cant_be_in_future

    def release_year_cant_be_in_future
        current_year = DateTime.now.year
        if release_year.to_i > current_year
            errors.add(:release_year, "can't be in the future")
        end 
    end

end
