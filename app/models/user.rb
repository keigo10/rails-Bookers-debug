class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false

  validates :introduction,    length: { maximum: 50 }

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: { in: 2..20}, presence: true
end
