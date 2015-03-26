class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :description, presence: true, length: {minimum: 50}
  validates_presence_of [:user, :question], presence: true
end
