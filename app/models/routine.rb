class Routine < ActiveRecord::Base
  belongs_to :users
  has_many :exercises
end
