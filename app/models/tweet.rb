class Tweet < ActiveRecord::Base
  be_longs :users
  has_many :favorites
end
