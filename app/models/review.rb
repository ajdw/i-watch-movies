class Review < ApplicationRecord

  validates :comment, length: { minimum: 4 }

  STARS = [1, 2, 3, 4, 5]

  validates :stars, inclusion: {
    in: STARS,
    message: "must be between 1 and 5"
}
  #belongs_to association 
  belongs_to :movie
  belongs_to :user
end
