class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { min: 2 }
  validates :phone, presence: true,
            format: { with: /^(?:\(?\+?48)?(?:[-\.\(\)\s]*(\d)){9}\)?$/,
            message: "only allows numbers" }
  validates :city, presence: true
  validates :street, presence: true
end
