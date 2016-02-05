class Favorite < ActiveRecord::Base
  be_longs :tweets
  be_longs :users
end
