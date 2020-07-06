class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, :user_id, presence: true
  validates :body, presence: true, if: -> { link.blank? }
  validates :link, presence: true, if: -> { body.blank? }
  validate :body_and_link_cannot_be_both_present

  private

  def body_and_link_cannot_be_both_present
    if body.present? && link.present?
      errors.add(:base, "body and link can't both be present")
    end
  end
end
