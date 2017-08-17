class Advert < ApplicationRecord
  belongs_to :user
  has_many :locations, inverse_of: :advert
  accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true,
                    format: { with: /\A\d{9}\z/,
                              message: "please type in format: '123456789'" }
end
