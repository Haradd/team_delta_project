class Advert < ApplicationRecord
  JOB_TYPES = %w[full_time part_time].freeze
  ADVERT_TYPES = %w[job care].freeze
  belongs_to :user
  has_many :locations, inverse_of: :advert
  accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 2, maximum: 400 }
  validates :city, presence: true
  validates :street, presence: true
  validates :phone, presence: true,
                    format: { with: /[1-9]\d*\d{8}/,
                              message: "please type in format: '123456789'" }

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :job_type, presence: true, inclusion: %w[full_time part_time]
  validates :advert_type, presence: true, inclusion: %w[job care]

  scope :by_advert_type, ->(type) { where "advert_type": type.to_s }
  scope :by_job_type, ->(type) { where "job_type": type.to_s }
  scope :by_city, ->(city) { where "city": city.to_s }
  scope :by_price, ->(price) { where("price < ?", price) }
end
