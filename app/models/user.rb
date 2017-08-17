class User < ApplicationRecord
  has_many :adverts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :phone, presence: true,
                    format: { with: /[1-9]\d*\d{8}/,
                              message: "please type in format: '123456789'" }
  validates :city, presence: true
  validates :street, presence: true

  has_attached_file :avatar, styles: { medium: "270x270#", small: "160x150#" },
                             default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\z}
end
