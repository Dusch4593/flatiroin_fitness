class User < ActiveRecord::Base
  has_secure_passwords
  has_many :routines
  has_many :exercises, through: :routines
end
