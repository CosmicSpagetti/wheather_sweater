class User < ApplicationRecord
  before_create :create_api_key

  has_secure_password
  validates_presence_of :email
  validates :email, uniqueness: true

  def create_api_key
    SecureRandom.uuid
  end
end
