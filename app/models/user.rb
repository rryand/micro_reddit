class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, length: { in: 4..12 }, uniqueness: true, presence: true
  validates :password, length: { in: 6..12 }, presence:true
end
