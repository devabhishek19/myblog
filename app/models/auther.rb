class Auther < ActiveRecord::Base
  has_many :posts

  validates :fname, presence: true
end
