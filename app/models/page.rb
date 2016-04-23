class Page < ActiveRecord::Base
	belongs_to :user
  validates :title, presence: true, length: {minimum: 3}
	validates :user_id, presence: true
end