class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  default_scope -> { order(created_at: :desc) }
  paginates_per 10

  validates :content, length:
             { in: 2..140,
               message: "は2文字以上140文字以内で入力してください。" }
end
