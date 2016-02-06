class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  default_scope -> { order(created_at: :desc) }
  paginates_per 10
end
