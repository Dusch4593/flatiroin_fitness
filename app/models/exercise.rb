class Exercise < ActiveRecord::Base
  belongs_to :routines
  belongs_to :user
end
