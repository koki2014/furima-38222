class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_many :items


  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
   validates :password, format: { with: VALID_PASSWORD_REGEX }


  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end

  
  validates :birthday, presence: true

end
