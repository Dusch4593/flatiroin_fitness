class User < ActiveRecord::Base
  has_secure_password
  has_many :routines
  has_many :exercises, through: :routines

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, confirmation: {case_sensitive: true}
end
