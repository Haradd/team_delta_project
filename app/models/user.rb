class User < ApplicationRecord
  has_many :adverts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :phone, presence: true,
                    format: { with: /A(?:\(?\+?48)?(?:[-\.\(\)\s]*(\d)){9}\)?z/,
                              message: "only allows numbers" }
  validates :city, presence: true
  validates :street, presence: true
end
