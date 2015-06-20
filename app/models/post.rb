class Post < ActiveRecord::Base
  belongs_to :auther
  validates :title, presence: true
end
