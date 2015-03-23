class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[a-z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/ }
  validates :password, presence: true, length: { minimum: 8 }
end
