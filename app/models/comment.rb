class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :farm

  validates :message, presence: true
  validates :rating, presence: true

  RATINGS = {
    '☆☆☆☆☆'  => '5_stars',
    '☆☆☆☆'  => '4_stars',
    '☆☆☆' => '3_stars',
    '☆☆'   => '2_stars',
    '☆'    => '1_star'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

end
