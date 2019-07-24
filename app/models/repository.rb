class Repository < ApplicationRecord
  scope :per_language, -> { order(stars: :desc).group_by(&:language) }
end
