class Advert < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, lenght: { in: 5..40,
                              message: "Title to long, please use description field" }
  validates :description, presence: true, lenght: { in: 5..150 }
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true,
                    format: { with: /\A\d{9}\z/,
                              message: "please type in format: '123456789'" }
end
