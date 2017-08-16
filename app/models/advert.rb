class Advert < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true,
                    format: { with: /\A\d{9}\z/,
                              message: "please type in format: '123456789'" }

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :job_type, presence: true, inclusion: %w[Full-time Part-time]
  validates :advert_type, presence: true, inclusion: %w[Nanny Child]

  scope :by_advert_type, ->(type) { where "advert_type": type.to_s }
  scope :by_job_type, ->(type) { where "job_type": type.to_s }
  scope :by_city, ->(city) { where "city": city.to_s }
  scope :by_price, ->(price) { where("price < ?", price) }
end
