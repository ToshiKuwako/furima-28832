class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :email,                 uniqueness: true, format: { with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password,              format: { with: /\A[a-zA-Z0-9]+\z/}, confirmation: true
    validates :password_confirmation, presence: true
    validates :first_name,            format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :family_name,           format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana,       format: { with: /\A[ァ-ヶー－]+\z/}
    validates :family_name_kana,      format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birth_date
    
    
  end


end
