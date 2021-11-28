class Airline < ApplicationRecord
  has_many :reviews

  before_create :slugify
  def slugify
    #take the name of the airline and convert it into a url safe and set it as a slug value
    self.slug = name.parameterize
  end

  def avg_score
    return 0 unless reviews.count.positive?
    reviews.average(:score).round(2).to_f
  end
end
